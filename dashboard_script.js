//dashboard.js


window.onload = async function () {
    const userId = localStorage.getItem("userId");

    const res = await fetch("/getProfile.php?userId=" + userId);
    const data = await res.json();

    const user = data[0];

    document.getElementById("usernameDisplay").innerText = user.UserID;
    document.getElementById("teamDisplay").innerText = user.Team_Name;
};

function loadQuery(type) {
    const content = document.getElementById("content");

    if (type === "events-region") {
        content.innerHTML = `
            <div class="query-card">
                <h2>Events by Region</h2>
                <input id="region" placeholder="Enter region">
                <button onclick="getData('events.php', 'region')">Search</button>
                <div id="results"></div>
                <img id="spinner" src="images/gears2.jpg" class="spinner-img">
            </div>
        `;
    } else if (type === "teams-region") {
        content.innerHTML = `
            <div class="query-card">
                <h2>Teams by Region</h2>
                <input id="region" placeholder="Enter Region">
                <button onclick="getData('teamsByRegion.php', 'region')">Search</button>
                <div id="results"></div>
                <img id="spinner" src="images/gears2.jpg" class="spinner-img">
            </div>
        `;
    } else if (type === "team-size") {
        content.innerHTML = `
            <div class="query-card">
                <h2>Team Size</h2>
                <input id="teamId" placeholder="Enter Team ID">
                <button onclick="getData('teamSize.php', 'teamId')">Search</button>
                <div id="results"></div>
                <img id="spinner" src="images/gears2.jpg" class="spinner-img">
            </div>
        `;
    } else if (type === "teams-event") {
        content.innerHTML = `
            <div class="query-card">
                <h2>Teams at an Event</h2>
                <input id="eventCode" placeholder="Enter Event Code">
                <button onclick="getData('teamsAtEvent.php', 'eventCode')">Search</button>
                <div id="results"></div>
                <img id="spinner" src="images/gears2.jpg" class="spinner-img">
            </div>
        `;
    } else if (type === "events-team") {
        content.innerHTML = `
            <div class="query-card">
                <h2>Events for a Team</h2>
                <input id="teamId" placeholder="Enter a team ID">
                <button onclick="getData('teamEvents.php', 'teamId')">Search</button>
                <div id="results"></div>
                <img id="spinner" src="images/gears2.jpg" class="spinner-img">
            </div>
        `;
    } else if (type === "avg-score") {
        content.innerHTML = `
            <div class="query-card">
                <h2>Average Score at an Event</h2>
                <input id="eventCode" placeholder="Enter an event code">
                <button onclick="getData('avgScore.php', 'eventCode')">Search</button>
                <div id="results"></div>
                <img id="spinner" src="images/gears2.jpg" class="spinner-img">
            </div>
        `;
    }


}

async function getData(path, id) {
    const idValue = document.getElementById(id).value;

    if (!idValue) {
        alert("Please enter an appropriate value");
        return;
    }

    const spinner = document.getElementById("spinner");
    const results = document.getElementById("results");

    spinner.classList.add("spinner-active");
    results.innerHTML = "";

    try {
        const res = await fetch(`/${path}?${id}=${encodeURIComponent(idValue)}`);
        let data = await res.json();

        if (!Array.isArray(data)) {
            data = [data];
        }

        renderTable(data);

    } catch (error) {
        results.innerHTML = "Error loading data.";
    }

    spinner.classList.remove("spinner-active");
}



function renderTable(data) {
    const results = document.getElementById("results");

    if (!data || data.length === 0) {
        results.innerHTML = "No results found.";
        return;
    }

    const allNull = Object.values(data[0]).every(val => val === null);

    if (allNull) {
        results.innerHTML = "No results found.";
        return;
    }


    let table = "<table><tr>";

    Object.keys(data[0]).forEach(key => {
        table += `<th>${key}</th>`;
    });

    table += "</tr>";

    data.forEach(row => {
        table += "<tr>";
        Object.values(row).forEach(val => {
            table += `<td>${val}</td>`;
        });
        table += "</tr>";
    });

    table += "</table>";

    results.innerHTML = table;
}

function goToProfile(){
    window.location.href = "profile.html";
}

function logout(){
    window.location.href = "login.html";
    localStorage.removeItem("userId");
}

