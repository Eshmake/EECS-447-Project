//profile.js

window.onload = async function () {

    try {
        const userId = localStorage.getItem("userId");
        
        await loadTeams();

        const res = await fetch("/getProfile.php?userId=" + userId);
        const data = await res.json();

        const user = data[0];

        document.getElementById("username").value = user.UserID;
        document.getElementById("team").value = user.TeamID;

        document.getElementById("password").value = user.User_Password;
        document.getElementById("confirmPassword").value = user.User_Password;

        document.getElementById("usernameDisplay").innerText = user.UserID;
        document.getElementById("teamDisplay").innerText = user.Team_Name;

    } catch (error) {
        console.error("Failed to load profile.", error);
    }
    
};

async function loadTeams() {
    const res = await fetch("/getTeams.php");
    const data = await res.json();

    const dropdown = document.getElementById('team');

    dropdown.innerHTML = '<option value="">Select a team</option>';

    data.forEach(team => {
        const option = document.createElement('option');
        option.value = team.TeamID;
        option.textContent = team.Team_Name;
        dropdown.appendChild(option);
    });
}

async function updateProfile() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const confirm = document.getElementById("confirmPassword").value;
    const team = document.getElementById("team").value;

    const userId = localStorage.getItem("userId");

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
        
        const res = await fetch("/updateProfile.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({userId, username, password, team})
        });

        const data = await res.json();

        if (data.success) {
            successMsg.innerText = "Profile updated successfully.";

            localStorage.setItem("userId", username);

        } else {
            errorMsg.innerText = data.message || "Update failed.";
        }

    } catch (error) {
        errorMsg.innerText = "Server error.";
    }
    
}

function logout() {
    window.location.href = "login.html";
    localStorage.removeItem("userId");
}

function goBack() {
    window.location.href = "dashboard.html";
}