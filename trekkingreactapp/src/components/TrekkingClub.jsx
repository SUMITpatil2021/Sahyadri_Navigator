import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Nav } from 'react-bootstrap';
import { NavDropdown } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
import { Footer } from './Footer';

function TrekkingClub() {
  let Navigate = useNavigate();

  const [dropdownOpen, setDropdownOpen] = useState(false);

  const toggleDropdown = () => {
    setDropdownOpen(!dropdownOpen);
  };

  return (
    <div className="container-fluid p-0 ">
      <nav className="navbar navbar-expand-lg navbar-light bg-light">
        <div className="container">
          <a className="navbar-brand" href="#">Sahyadri Navigator</a>
          <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav">
              <li className="nav-item">
                <a className="nav-link" onClick={() => { Navigate('/AddTrekk') }}>Add Trekk</a>
              </li>
              <li className="nav-item">
                <a className="nav-link" onClick={() => { Navigate('/ListEmail') }}>List Email</a>
              </li>
              <li className="nav-item">
                <a className="nav-link" onClick={() => { Navigate('/Feedback') }}>Feedback</a>
              </li>
              <li className="nav-item">
                <Nav>
                  <NavDropdown
                    id="nav-dropdown-primary-example"
                    title="Profile"
                    menuVariant="light">
                    <NavDropdown.Item onClick={()=>{Navigate('/ViewProfile')}}>View Profile</NavDropdown.Item>
                    <NavDropdown.Item onClick={()=> {Navigate('/EditClubProfile')}}>Edit</NavDropdown.Item>
                    <NavDropdown.Item onClick={()=> {Navigate('/UserLogin')}}>Logout</NavDropdown.Item>
                  </NavDropdown>
                </Nav>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <main className="container py-4">
        <h2>Welcome to Sahyadri Navigator</h2>
        <p>You haven't added any upcoming trek.</p>
      </main>

      <div>
      <Footer/>
      </div>
    </div>
  );
}

export default TrekkingClub;