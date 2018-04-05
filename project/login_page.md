```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title>单点登录页面</title>
    <link rel="stylesheet" th:href="@{/plugins/bootstrap/3.3.7/css/bootstrap.min.css}"
          href="../static/plugins/bootstrap/3.3.7/bootstrap.min.css"/>
    <link rel="stylesheet" th:href="@{/plugins/toastr/toastr.min.css}"
          href="../static/plugins/toastr/toastr.min.css"/>
</head>
<body>
<div class="container" id="loginVm" v-cloak>
    <div id="loginbox" style="margin-top:50px;" v-if="boxShow" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">登录</div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">忘记密码?</a>
                </div>
            </div>

            <div style="padding-top:30px" class="panel-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form @submit.prevent="submit" class="form-horizontal" role="form">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="login-username" type="text" v-model="user.userName" class="form-control" name="userName" value=""
                               placeholder="请输入账号或者邮箱">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" v-model="user.password" class="form-control" name="password"
                               placeholder="请输入密码">
                    </div>


                    <div class="input-group">
                        <div class="checkbox">
                            <label>
                                <input id="login-remember" type="checkbox" name="remember" value="1"> 记住账号密码
                            </label>
                        </div>
                    </div>


                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">
                            <button class="btn btn-success" type="submit">登录</button>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                没有账号！
                                <a href="#" v-on:click="switchBox(false)">
                                    点击注册
                                </a>
                            </div>
                        </div>
                    </div>
                </form>


            </div>
        </div>
    </div>
    <div id="signupbox"  v-if="!boxShow" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">注册</div>
                <div style="float:right; font-size: 85%; position: relative; top:-10px">
                    <a id="signinlink" href="#" v-on:click="switchBox(true)">登录</a>
                </div>
            </div>
            <div class="panel-body">
                <form id="signupform" class="form-horizontal" role="form">

                    <div id="signupalert" style="display:none" class="alert alert-danger">
                        <p>Error:</p>
                        <span></span>
                    </div>


                    <div class="form-group">
                        <label for="email" class="col-md-3 control-label">邮箱</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="email" placeholder="请输入邮箱">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="userName" class="col-md-3 control-label">用户名</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="userName" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nickName" class="col-md-3 control-label">昵称</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="nickName" placeholder="请输入昵称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label">密码</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                            <button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i>
                                &nbsp 注册
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script th:src="@{/plugins/vuejs/vue.min.js}"></script>
<script th:src="@{/plugins/jquery/3.3.1/jquery-3.3.1.min.js}"></script>
<script th:src="@{/plugins/bootstrap/3.3.7/js/bootstrap.min.js}"></script>
<script th:src="@{/plugins/toastr/toastr.min.js}"
        src="../static/plugins/toastr/toastr.min.js"></script>
<script th:src="@{/js/commons.js}"></script>
<script th:src="@{/js/login/login.js}"></script>
</body>
</html>
```

