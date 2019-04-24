<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sweater</title>
</head>
<body>
    <form action="/login" method="post">
        <div>
            <label>Username:</label>
            <div>
                <input type="text" name="username"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </div>
        </div>
        <div>
            <label>Password:</label>
            <div>
                <input type="password" name="password"/>
            </div>
        </div>
        <button type="submit">Sign in</button>
    </form>
    <a href="/registration">Add new user</a>
</body>
</html>