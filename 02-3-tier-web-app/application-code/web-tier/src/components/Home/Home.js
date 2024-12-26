import React, { Component } from 'react';
import architecture from '../../assets/architecture-3-tier-web-app.svg';
// architecture-3-tier-web-app. png | svg
import './Home.css'

class Home extends Component {
  render() {
    return (
      <div className="container">
        <h1 style={{ color: "white" }}>AWS 3-TIER WEB APP</h1>
        <img src={architecture} alt="3-Tier Web App Architecture" className="architecture-image" />
        <h5 className="myFooter" style={{ color: "white" }}>Sevices : VPC, Internet GW, ALB, EC2 ASG, Aurora Multi-AZ</h5>
      </div>
    );
  }
}

export default Home;
