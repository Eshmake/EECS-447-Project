//account.js

const API = "http://localhost:4000";

window.onload = loadTeams;

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

async function createAccount() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const team = document.getElementById("team").value;

    const errorMsg = document.getElementById("errorMsg");

    // Basic validation
    if (!username || !password || !confirmPassword || !team) {
        errorMsg.innerText = "Please fill all fields.";
        return;
    }

    if (password !== confirmPassword) {
        errorMsg.innerText = "Passwords do not match.";
        return;
    }

    try {
        const res = await fetch(`${API}/createAccount`, {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({ username, password, team })
        });

        if (res.ok) {
            // Redirect to login after success
            window.location.href = "login.html";
        } else {
            errorMsg.innerText = "Username already exists.";
        }

    } catch (err) {
        errorMsg.innerText = "Server error.";
    }
}