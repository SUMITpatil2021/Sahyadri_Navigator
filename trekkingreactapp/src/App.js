import logo from './logo.svg';
import './App.css';
import AdminDashboard from './components/AdminDashboard';
import DropdownList from './components/Dummy';
import { Link, Route, Routes } from 'react-router-dom';
import TrekkingClub from './components/TrekkingClub';
import AddTrekk from './components/AddTrekk';
import Profile from './components/ViewProfile';
import ViewProfile from './components/ViewProfile';
import UserLogin from './components/UserLogin';
import UserRegistration from './components/UserRegistration';

function App() {
  return (
    <div className="App">
      {/* <DropdownList /> */}
      {/* <ul className='nav navbar'>
           <li className='nav-item'><Link to="/StudentLogin">Login</Link></li>
           <li className='nav-item'><Link to="/Dashboard">Update Password</Link></li>
           <li className='nav-item'><Link to="/Logout">Logout</Link></li>
           <li className='nav-item'><Link to="/TrekkingClub">TrekkingClub</Link></li>
        </ul> */}
      {/* <TrekkingClub/> */}
        {/* <Routes> 
         <Route path='/' element={<Home/>}/>  
         <Route path='/TrekkingClub' element={<TrekkingClub/>}/>
         <Route path='/AddTrekk' element={<AddTrekk/>}/>
         <Route path='/Profile' element={<Profile/>}/>
         <Route path='/ViewProfile' element={<ViewProfile/>}/>
         <Route path='/UserLogin' element={<UserLogin/>}/>
          <Route path='/*' element={<All/>}/>
        </Routes>  */}
        <AdminDashboard />
        <UserRegistration/>
    </div>
  );
}

export default App;
