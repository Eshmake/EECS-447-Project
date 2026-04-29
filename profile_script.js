//profile.js

const API = "http://localhost:4000";

window.onload = async function () {

    try {
        const userId = localStorage.getItem("userId");
        
        await loadTeams();

        const res = await fetch(`${API}/profile?userId=${userId}`);
        const data = await res.json();

        const user = data[0];

        document.getElementById("username").value = user.UserID;
        document.getElementById("team").value = user.TeamID;

        document.getElementById("password").value = user.Password;
        document.getElementById("confirmPassword").value = user.Password;

        document.getElementById("usernameDisplay").innerText = user.UserID;
        document.getElementById("teamDisplay").innerText = user.TeamID;

    } catch (error) {
        console.error("Failed to load profile.", error);
    }
    
};

function loadTeams() {
    fetch(`${API}/teams`)
        .then(res => res.json())
        .then(data => {
            const dropdown = document.getElementById('team');

            // empty option
            dropdown.innerHTML = '<option value="">Select a team</option>';

            data.forEach(team => {
                const option = document.createElement('option');
                option.value = team.TeamID;
                option.textContent = team.Name;
                dropdown.appendChild(option);
            });
        });
}

async function updateProfile() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const confirm = document.getElementById("confirmPassword").value;
    const team = document.getElementById("team").value;

    const successMsg = document.getElementById("successMsg");
    const errorMsg = document.getElementById("errorMsg");

    successMsg.innerText = "";
    errorMsg.innerText = "";

    if(!password || !username || !confirm || !team){
        errorMsg.innerText = "Please fill all fields.";
        return;
    }

    if(password !== confirm){
        errorMsg.innerText = "Passwords do not match.";
        return;
    }

    try {
        
        const res = await fetch("/update-profile", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({username, password, team})
        });

        if(res.ok){
            successMsg.innerText = "Profile updated successfully.";
        } else {
            errorMsg.innerText = "Update failed.";
        }
        
    } catch (error) {
        errorMsg.innerText = "Server error.";
    }
    
}

function logout() {
    window.location.href = "login.html";
}

function goBack() {
    window.location.href = "dashboard.html";
}