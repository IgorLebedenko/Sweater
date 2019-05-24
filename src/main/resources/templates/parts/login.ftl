<#macro login path isRegisterForm>
    <form action=${path} method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Username:</label>
            <div class="col-sm-3">
                <input class="form-control ${(usernameError??)?string('is-invalid', '')}" type="text"
                       value="<#if user??>${user.username}</#if>" name="username" placeholder="Username"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-3">
                <input class="form-control ${(passwordError??)?string('is-invalid', '')}" type="password"
                       name="password" placeholder="Password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Confirm password:</label>
                <div class="col-sm-3">
                    <input class="form-control ${(password2Error??)?string('is-invalid', '')}" type="password"
                           name="password2" placeholder="Confirm password"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email:</label>
                <div class="col-sm-3">
                    <input class="form-control ${(emailError??)?string('is-invalid', '')}" type="email"
                           value="<#if user??>${user.email}</#if>" name="email" placeholder="Email"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" class="btn btn-primary">
            <#if isRegisterForm>
                Sign in
            <#else>
                Log in
            </#if>
        </button>

        <#if !isRegisterForm>
            <a href="/registration" class="col-sm-3 ml-5">
                Add new user
            </a>
        </#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-outline-info">Sign out</button>
    </form>
</#macro>
