<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form action="/main" method="get" class="form-inline">
                <input class="form-control" type="text" name="filter" value="${filter?ifExists}" placeholder="Filter tag"/>
                <button type="submit" class="btn btn-primary ml-2">Search by tag</button>
            </form>
        </div>
    </div>

    <a class="btn btn-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form action="/add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input class="form-control col-md-5" type="text" name="text" placeholder="Enter message"/>
                </div>
                <div class="form-group">
                    <input class="form-control col-md-4" type="text" name="tag" placeholder="Enter tag"/>
                </div>
                <div class="form-group">
                    <div class="custom-file col-md-4">
                        <input type="file" name="file" class="custom-file-input" id="customFile"/>
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary mt-3">Save</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img class="card-img-top" src="/img/${message.filename}">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${(message.author.username)!"&lt;none&gt;"}
                </div>
            </div>
        <#else>
            No messages(
        </#list>
    </div>
</@c.page>