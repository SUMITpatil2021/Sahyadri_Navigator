// import { Dropdown } from 'react-bootstrap';
import { Container } from 'react-bootstrap';
import { Nav } from 'react-bootstrap';
import { Navbar } from 'react-bootstrap';
import { NavDropdown } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css'
import { Footer } from './Footer';

export default function AdminDashboard() {
    return (


        <div>
            <div className="row bg-warning">
                <nav className="navbar  navbar-inverse">
                    <div className="container-fluid">
                        <div className="navbar-header">
                            <a className="navbar-brand" href="#">Sahyadri Navigator</a>
                        </div>
                        <div className="col">
                            <ul className="nav navbar">
                                <li>
                                    <Navbar variant="primary" bg="light" expand="lg">
                                        <Container fluid>
                                            <Nav>
                                                <NavDropdown
                                                    id="nav-dropdown-primary-example"
                                                    title="View Users"
                                                    menuVariant="light"
                                                >
                                                    <NavDropdown.Item href="#action/3.1">Trekker</NavDropdown.Item>
                                                    <NavDropdown.Item href="#action/3.2">Trekking Club</NavDropdown.Item>
                                                </NavDropdown>
                                            </Nav>
                                        </Container>
                                    </Navbar>
                                </li>
                               <li>
                               <Navbar variant="primary" bg="light" expand="lg">
                                        <Container fluid>
                                            <Nav>
                                                <NavDropdown
                                                    id="nav-dropdown-primary-example"
                                                    title="Trekker Management"
                                                    menuVariant="light"
                                                >
                                                    <NavDropdown.Item href="#action/3.1">View Trekkers</NavDropdown.Item>
                                                    <NavDropdown.Item href="#action/3.2">Edit</NavDropdown.Item>
                                                    <NavDropdown.Item href="#action/3.2">Delete</NavDropdown.Item>
                                                </NavDropdown>
                                            </Nav>
                                        </Container>
                                    </Navbar>
                               </li>


                               <li>
                               <Navbar variant="primary" bg="light" expand="lg">
                                        <Container fluid>
                                            <Nav>
                                                <NavDropdown
                                                    id="nav-dropdown-primary-example"
                                                    title="Trekking club Management"
                                                    menuVariant="light"
                                                >
                                                    <NavDropdown.Item href="#action/3.1">View Trekking Club</NavDropdown.Item>
                                                    <NavDropdown.Item href="#action/3.2">Edit</NavDropdown.Item>
                                                    <NavDropdown.Item href="#action/3.2">Delete</NavDropdown.Item>
                                                </NavDropdown>
                                            </Nav>
                                        </Container>
                                    </Navbar>
                               </li>

                               <li>
                               <Navbar variant="primary" bg="light" expand="lg" >
                                        <Container fluid>
                                            <Nav>
                                                <NavDropdown
                                                    id="nav-dropdown-primary-example"
                                                    title="Payment Status"
                                                    menuVariant="light"
                                                >
                                                    <NavDropdown.Item href="#action/3.1">Trekker</NavDropdown.Item>
                                                    <NavDropdown.Item href="#action/3.2">Trekking Club</NavDropdown.Item>
                                                </NavDropdown>
                                            </Nav>
                                        </Container>
                                    </Navbar>
                               </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div>

            </div> 
            
            {/* <footer className="bg-light py-3 position-absolute   bottom-0 w-100" >
                <div className="container text-center">
                    <p> Copyright &copy; 2023 Sahyadri Navigator All rights reserved.</p>
                </div>
            </footer> */}
            <Footer />

          
        </div>
    )
}