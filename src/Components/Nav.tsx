import { useState } from "react";

const Nav = () => {
  const [isOpen, setIsOpen] = useState(false);
  return (
    <div className="nav-container">
      {/* Left: Logo */}
      <div className="nav-left">
        <p className="logo-text">EffectStats</p>
      </div>

      {/* Center: Links */}
      <div className={`nav-menu ${isOpen ? "open" : ""}`}>
        <div className="nav-links">
          <a href="#">Home</a>
          <a href="#">Who we are</a>
          <a href="#">Services</a>
          <a href="#">Statistical Tools</a>
          <a href="#">Contact Us</a>
        </div>
      </div>

      {/* Right: Hamburger */}
      <button onClick={() => setIsOpen(!isOpen)} className="mobile-nav">
        <img
          src="/menu.png"
          style={{ width: "24px", height: "24px" }}
          alt="menu"
        />
      </button>
    </div>
  );
};

export default Nav;
