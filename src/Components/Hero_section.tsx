import { useState } from "react";

const HeroSection = () => {
  const [isHovered, setIsHovered] = useState("learn");
  return (
    <>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          flexDirection: "column",
          gap: "64px",
          paddingTop: "50px",
        }}
      >
        <p className="hero-text">10+ years of Clinical Excellence</p>

        <div className="hero-subtext">
          <p className="hero-title">
            Clinical data professionals with{" "}
            <span className="highlight">passion & pride</span> in quality data
            profession
          </p>
          <p className="hero-description">
            We are your integrated data science team in clinical development,
            providing tailored support based on your needs at different stages
            of your clinical and business development.
          </p>
        </div>

        <div className="hero-link-button">
          <a
            href="#"
            className={
              isHovered === "learn" ? "link-button active" : "link-button"
            }
            onClick={() => setIsHovered("learn")}
          >
            Learn More About Us
          </a>
          <a
            href="#"
            className={
              isHovered === "services" ? "link-button active" : "link-button"
            }
            onClick={() => setIsHovered("services")}
          >
            View Our Services
          </a>
        </div>

        <div className="bio-sections">
          <div className="bio-container">
            <div
              style={{
                display: "flex",
                flexDirection: "column",
                alignItems: "center",
                gap: "24px",
              }}
            >
              <div className="bio-icon">
                <img src="/stats.png" style={{ width: "50px", height: "50px" }} />
              </div>
              <div
                style={{
                  display: "flex",
                  flexDirection: "column",
                  alignItems: "center",
                  gap: "12px",
                }}
              >
                {" "}
                <p style={{ fontWeight: "600" }}>Bio-statistical Excellence</p>
                <p className="bio-paragraph">
                  Strategic level biostatistical support and innovative
                  statistical science from experienced professionals.
                </p>
              </div>
            </div>
          </div>
          <div className="bio-container">
            <div
              style={{
                display: "flex",
                flexDirection: "column",
                alignItems: "center",
                gap: "24px",
              }}
            >
              <div className="bio-icon">
                <img src="/db.png" style={{ width: "50px", height: "50px" }} />
              </div>
              <div
                style={{
                  display: "flex",
                  flexDirection: "column",
                  alignItems: "center",
                  gap: "12px",
                }}
              >
                {" "}
                <p style={{ fontWeight: "600" }}>Bio-statistical Excellence</p>
                <p className="bio-paragraph">
                  Strategic level biostatistical support and innovative
                  statistical science from experienced professionals.
                </p>
              </div>
            </div>
          </div>
          <div className="bio-container">
            <div
              style={{
                display: "flex",
                flexDirection: "column",
                alignItems: "center",
                gap: "24px",
              }}
            >
              <div className="bio-icon">
                <img src="/bio.png" style={{ width: "50px", height: "50px" }} />
              </div>
              <div
                style={{
                  display: "flex",
                  flexDirection: "column",
                  alignItems: "center",
                  gap: "12px",
                }}
              >
                {" "}
                <p style={{ fontWeight: "600" }}>Bio-statistical Excellence</p>
                <p className="bio-paragraph">
                  Strategic level biostatistical support and innovative
                  statistical science from experienced professionals.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default HeroSection;
