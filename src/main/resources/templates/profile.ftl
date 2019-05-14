<#import "parts/common.ftl" as c>

<@c.page>
    <h5>${username}</h5>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">Password:</label>
            <div class="col-sm-3">
                <input class="form-control" type="password" name="password" placeholder="Password"/>
            </div>
        </div>
        <div class="form-group row">
                <label class="col-sm-1 col-form-label">Email:</label>
                <div class="col-sm-3">
                    <input class="form-control" type="email" name="email" value="${email?ifExists}"/>
                </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>