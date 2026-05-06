//account.js

window.onload = loadTeams;

function loadTeams() {
    fetch("/getTeams.php")
        .then(res => {
            if (!res.ok) {
                throw new Error("Failed to fetch teams");
            }
            return res.json();
        })
        .then(data => {
            const dropdown = document.getElementById("team");

            // Clear + default option
            dropdown.innerHTML = '<option value="">Select a team</option>';

            data.forEach(team => {
                const option = document.createElement("option");
                option.value = team.TeamID;
                option.textContent = `${team.TeamID} - ${team.Team_Name}`;
                dropdown.appendChild(option);
            });
        })
        .catch(err => {
            console.error("Error loading teams:", err);
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
        const res = await fetch("/createAccount.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({ username, password, team })
        });

        const data = await res.json();

        if (!data.success) {
            errorMsg.innerText = data.message;
        } else {
            window.location.href = "login.html";
        }

    } catch (err) {
        errorMsg.innerText = "Server error.";
    }
}