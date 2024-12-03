import json
import boto3
from decimal import Decimal

# Initialize DynamoDB client
dynamodb = boto3.resource('dynamodb', region_name='ap-south-1')
table = dynamodb.Table('crud-dynamodb-sahal-v1')  # Replace with your DynamoDB table name
counter_table = dynamodb.Table('CounterTable')

cors_headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
    "Access-Control-Allow-Headers": "Content-Type"
}


def lambda_handler(event, context):
    """
    Lambda handler to manage CRUD operations for student management.
    """
    method = event['httpMethod']
    path = event['path']
    path_parameters = event.get('pathParameters', {})
    student_id = path_parameters.get('id') if path_parameters else None

    # Ensure student_id is converted to int if present
    if student_id:
        try:
            student_id = int(student_id)
        except ValueError:
            return {
                'statusCode': 400,
                "headers": cors_headers,
                'body': json.dumps({'message': 'Invalid ID format'})
            }

    # Route based on the HTTP method and path
    if path == "/students":
        if method == "GET":
            return list_students()
        elif method == "POST":
            return create_student(event)
    elif path.startswith("/students/") and student_id:
        if method == "GET":
            return get_student(student_id)
        elif method == "PUT":
            return update_student(event, student_id)
        elif method == "DELETE":
            return delete_student(student_id)
    return {
        'statusCode': 400,
        "headers": cors_headers,
        'body': json.dumps({'message': 'Invalid endpoint or HTTP method'})
    }

def list_students():
    """
    Fetch all students.
    """
    try:
        response = table.scan()
        students = response.get('Items', [])
        return {
            'statusCode': 200,
            "headers": cors_headers,
            'body': json.dumps(students, default=decimal_to_standard)
        }
    except Exception as e:
        return {
            'statusCode': 500,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Error listing students', 'error': str(e)})
        }

def create_student(event):
    """
    Create a new student.

    we have used another table CounterTable for maintaining 
    auto increment in main table: crud-dynamodb-sahal-v1.

    working:
      - we will store counter value in CounterTable
      - when will create item in crud-dynamodb-sahal-v1:
        - update & fetch value of counter in CounterTable
        - use that value as id in crud-dynamodb-sahal-v1's item record
    """
    try:
        data = json.loads(event['body'])
        
        # Increment counter
        response = counter_table.update_item(
            Key={'id': 'student_id_counter'},
            UpdateExpression="SET #count = if_not_exists(#count, :start) + :incr",
            ExpressionAttributeNames={'#count': 'current_value'},
            ExpressionAttributeValues={
                ':start': 0,
                ':incr': 1
            },
            ReturnValues="UPDATED_NEW"
        )

        student_id = int(response['Attributes']['current_value'])

        item = {
            'id': student_id,
            'name': data['name'],
            'rollNo': data['rollNo'],
            'contact': data['contact'],
            'email': data['email']
        }
        table.put_item(Item=item)
        return {
            'statusCode': 201,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Student created', 'id': student_id})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Error creating student', 'error': str(e)})
        }

def get_student(student_id):
    """
    Fetch a student by ID.
    """
    try:
        response = table.get_item(Key={'id': student_id})
        if 'Item' in response:
            return {
                'statusCode': 200,
                "headers": cors_headers,
                'body': json.dumps(response['Item'], default=decimal_to_standard)
            }
        return {
            'statusCode': 404,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Student not found'})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Error fetching student', 'error': str(e)})
        }

def update_student(event, student_id):
    """
    Update an existing student by ID.
    """
    try:
        data = json.loads(event['body'])
        update_expression = "set #name=:name, rollNo=:rollNo, contact=:contact, email=:email"
        expression_attribute_values = {
            ':name': data['name'],
            ':rollNo': data['rollNo'],
            ':contact': data['contact'],
            ':email': data['email']
        }
        expression_attribute_names = {'#name': 'name'}
        table.update_item(
            Key={'id': student_id},
            UpdateExpression=update_expression,
            ExpressionAttributeValues=expression_attribute_values,
            ExpressionAttributeNames=expression_attribute_names
        )
        return {
            'statusCode': 200,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Student updated'})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Error updating student', 'error': str(e)})
        }

def delete_student(student_id):
    """
    Delete a student by ID.
    """
    try:
        table.delete_item(Key={'id': student_id})
        return {
            'statusCode': 200,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Student deleted'})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            "headers": cors_headers,
            'body': json.dumps({'message': 'Error deleting student', 'error': str(e)})
        }

def decimal_to_standard(obj):
    """
    Convert DynamoDB Decimal to int or float.
    """
    if isinstance(obj, Decimal):
        if obj % 1 == 0:
            return int(obj)
        else:
            return float(obj)
    raise TypeError
