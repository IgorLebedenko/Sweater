<#import "parts/common.ftl" as c>

<@c.page>
    <table class="table table-bordered table-sm">
        <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Roles</th>
                <th colspan="2">Options</th>
            </tr>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <td>
                        <div class="tableCell">
                            ${user.id}
                        </div>
                    </td>
                    <td>
                        <div class="tableCell">
                            ${user.username}
                        </div>
                    </td>
                    <td>
                        <div class="tableCell">
                            <#list user.roles as role>${role}<#sep>, </#list>
                        </div>
                    </td>
                    <td>
                        <div class="tableCell">
                            <a href="/users/edit/${user.id}">Edit</a>
                        </div>
                    </td>
                    <td class="deleteColumn">
                        <form action="/users/delete/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
            </#list>
        </tbody>
    </table>
</@c.page>