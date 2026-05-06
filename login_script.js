//login_script.js


async function handleLogin() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    const errorMsg = document.getElementById("errorMsg");

    if (!username || !password) {
        errorMsg.innerText = "Please fill all fields.";
        return;
    }

    try {
        const res = await fetch("/login.php", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({ username, password })
        });

        const data = await res.json();

        if (data.length > 0) {
            localStorage.setItem("userId", data[0].UserID);
            window.location.href = "dashboard.html";
        } else {
            document.getElementById("errorMsg").innerText = "Invalid login";
        }

    } catch (err) {
        errorMsg.innerText = "Server error.";
    }
}


