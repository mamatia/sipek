<?php
include 'connect.php';
if(!empty($_POST)){
    $sth = $db->prepare('SELECT * FROM user WHERE username = :username AND password = :password');
    $sth->execute(array(
        'username' => $_POST['username'],
        'password' => md5($_POST['password']),
    ));
    $user = $sth->fetch(PDO::FETCH_ASSOC);
    if($user){
        session_start();
        $_SESSION['user'] = $user;
        header('Location: index.php');
    }
    
    $wrong = true;
    
}

?>
<?php include 'header.php' ?>

<div class="body" align="center">
    <h1>Login Page</h1>
    <?php if(isset($wrong)):?>
    <div class="message" align="center">
        Login atau Password Salah!
    </div>
    <?php endif?>
	<br>
    <form  method="post" align="center">
        <div class="dialog" class="center">
            <table align="center">
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="username"><h1>username</h1></label>
                        </td>
                        <td valign="top" class="value ">
                            <h1><input type="text" name="username" value="" id="username" /></h1>
                        </td>
                    </tr> 
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="password"><h1>password</h1></label>
                        </td>
                        <td valign="top" class="value ">
                            <h1><input type="password" name="password" value="" id="password" /></h1>

                        </td>
                    </tr> 
                </tbody>
            </table>
        </div>
		<br>
        <div class="buttons" align="center">
            <span class="button"><input type="submit" value="Login" /></span>
        </div>
    </form>
	<br>
	<?php include 'footer.php' ?>
