<%--suppress XmlDuplicatedId --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="include/meta.jsp" %>
    <title>Anime Discs - 碟片列表</title>
    <%@ include file="include/import.jsp" %>
    <link href="styles/table.css" rel="stylesheet"/>
    <script src="scripts/table.js"></script>
</head>
<body>
<%@ include file="include/navbar.jsp" %>
<div id="content"></div>
<script id="tables-tmpl-small" type="text/html">
    {{each lists as list idx}}
    <table id="{{list.key}}" class="table sorter table-bordered table-striped">
        <caption>
            <span><b>{{list.title}}</b></span>
            <span><span class="hidden-xxs">上次更新 </span>{{list.time | fm_timeout}}</span>
        </caption>
        <thead>
        <tr>
            <th class="index hidden-xxm">ID</th>
            <th class="index hidden-xxm zero-width"></th>
            <th style="width: 108px" class="rank sorter">排名</th>
            <th class="sname sorter">碟片标题</th>
        </tr>
        </thead>
        <tbody>
        {{each list.discs as disc idx2}}
        <tr id="row-{{idx+1}}-{{idx2+1}}">
            <td class="index hidden-xxm" data-number="{{idx2+1}}">{{idx2+1}}</td>
            <td class="index hidden-xxm zero-width">)</td>
            <td class="rank" data-number="{{disc.arnk}}">
                <a href="list_rank.jsp?id={{disc.id}}">{{disc | fm_dirk}}</a>
            </td>
            <td class="sname">
                <a href="${param.admin?"edit":"view"}_disc.jsp?id={{disc.id}}">{{disc.sname}} {{disc | fm_verstr}}</a>
            </td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    {{/each}}
</script>
<script id="tables-tmpl" type="text/html">
    {{each lists as list idx}}
    <table id="{{list.key}}" class="table sorter table-striped table-bordered">
        <caption>
            <span><b>{{list.title}}</b></span>
            {{if list.time}}
            <span>更新时间: {{list.time | fm_date:"yyyy-MM-dd hh:mm:ss"}}</span>
            <span>(距离现在 {{list.time | fm_timeout}})</span>
            {{/if}}
            {{if is_timeout(list.time)}}
            <div class="text-warning">
                <span>提示: Sakura可能是延迟了两小时以上, 建议打开更多Amazon排名数据.</span>
                <span>(点击功能 -> 自定义表格格式 -> Amazon排名模式 或 手动选中Rank1 ~ 5)</span>
            </div>
            {{/if}}
        </caption>
        <thead>
        <tr>
            <th class="index sorter">序号</th>
            <th class="index zero-width"></th>
            <th class="srnk sorter">当前/前回</th>
            <th class="atot sorter">更新时间</th>
            <th class="cupt zero-width"></th>
            <th class="cupt sorter">累积PT</th>
            <th class="cupt zero-width"></th>
            <th class="sday sorter">剩余天数</th>
            <th class="cubk zero-width"></th>
            <th class="cubk sorter">Nico预约</th>
            <th class="cubk zero-width"></th>
            <th class="release sorter">发售日期</th>
            <th class="japan sorter">日文原名</th>
            <th class="title sorter">碟片标题</th>
            <th class="rank1 sorter">Rank1</th>
            <th class="date1 sorter">更新1</th>
            <th class="rank2 sorter">Rank2</th>
            <th class="date2 sorter">更新2</th>
            <th class="rank3 sorter">Rank3</th>
            <th class="date3 sorter">更新3</th>
            <th class="rank4 sorter">Rank4</th>
            <th class="date4 sorter">更新4</th>
            <th class="rank5 sorter">Rank5</th>
            <th class="date5 sorter">更新5</th>
        </tr>
        </thead>
        <tbody>
        {{each list.discs as disc idx2}}
        <tr>
            <td class="index" data-number="{{idx2+1}}">{{idx2+1}}</td>
            <td class="index zero-width">)</td>
            <td class="srnk" data-number="{{disc.arnk}}">
                <a href="list_rank.jsp?id={{disc.id}}" target="_blank">
                    {{disc.rank1 | fm_sakura:6}}位/{{disc.rank2 | fm_sakura:6}}位
                </a>
            </td>
            <td class="atot" data-number="{{disc.amdt}}">{{disc.amdt | fm_timeout}}</td>
            <td class="cupt zero-width">(</td>
            <td class="cupt" data-number="{{disc.cupt}}">{{disc.cupt | fm_sakura}} pt</td>
            <td class="cupt zero-width">)</td>
            <td class="sday" data-number="{{disc.sday}}">{{disc.sday}}天</td>
            <td class="cubk zero-width">[</td>
            <td class="cubk" data-number="{{disc.cubk}}">{{disc.cubk | fm_number}} 预约</td>
            <td class="cubk zero-width">]</td>
            <td class="release" data-number="{{disc.release}}">{{disc.release | fm_date:"yyyy/MM/dd"}}</td>
            <td class="japan">
                <a href="${param.admin?"edit":"view"}_disc.jsp?id={{disc.id}}">{{disc.japan}}</a>
            </td>
            <td class="title">
                <a href="${param.admin?"edit":"view"}_disc.jsp?id={{disc.id}}">{{disc.title}}</a>
            </td>
            <td class="rank1" data-number="{{disc.rank1}}">{{disc.rank1 | fm_number}}位</td>
            <td class="date1" data-number="{{disc.date1}}">{{disc.date1 | fm_rtmout}}</td>
            <td class="rank2" data-number="{{disc.rank2}}">{{disc.rank2 | fm_number}}位</td>
            <td class="date2" data-number="{{disc.date2}}">{{disc.date2 | fm_rtmout}}</td>
            <td class="rank3" data-number="{{disc.rank3}}">{{disc.rank3 | fm_number}}位</td>
            <td class="date3" data-number="{{disc.date3}}">{{disc.date3 | fm_rtmout}}</td>
            <td class="rank4" data-number="{{disc.rank4}}">{{disc.rank4 | fm_number}}位</td>
            <td class="date4" data-number="{{disc.date4}}">{{disc.date4 | fm_rtmout}}</td>
            <td class="rank5" data-number="{{disc.rank5}}">{{disc.rank5 | fm_number}}位</td>
            <td class="date5" data-number="{{disc.date5}}">{{disc.date5 | fm_rtmout}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    {{/each}}
</script>
<div id="profile-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">自定义表格格式</h4>
            </div>
            <div id="profile-body" class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script id="profile-tmpl" type="text/html">
    <label>快速选择</label>
    <div id="div-quick">
        {{each quick as q}}
        <label>
            <button class="button" data-checked="{{q.checked.join(',')}}">{{q.title}}</button>
        </label>
        {{/each}}
    </div>
    <label>选择想显示的列</label>
    <div id="div-hidden">
        {{each hidden as h}}
        <label>
            <input type="checkbox" data-class="{{h.clazz}}" checked="checked">
            {{h.title}}
        </label>
        {{/each}}
    </div>
</script>
<script id="navbar-tmpl" type="text/html">
    <li class="dropdown hidden-xs">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            功能<b class="caret"></b>
        </a>
        <ul id="control" class="dropdown-menu">
            <li><a href="javascript:navbar.refresh()">刷新</a></li>
            <li><a href="javascript:table.show_pro()">自定义表格格式</a></li>
        </ul>
    </li>
</script>
<script>
    $(function () {
        render_navber_menu();
        handle_switch_action();
        handle_refresh_action();
        handle_profile_action();
        handle_pageshow_action();
    });

    function render_navber_menu() {
        $("#nav-body").prepend($("#navbar-tmpl").html());
    }

    function handle_switch_action() {
        device.switch(function () {
            if (cache.data) {
                render_page(cache.data);
            } else {
                ajax_update_page();
            }
        });
    }

    function handle_profile_action() {
        table.show_pro(function () {
            $("#profile-modal").modal();
        });
    }

    function handle_refresh_action() {
        navbar.refresh(ajax_update_page);
    }

    function handle_pageshow_action() {
        $("body").get(0).onpageshow = function () {
            setTimeout(function () {
                navbar.refresh();
            }, 10);
        };
    }

    function ajax_update_page() {
        $.getJSON("list_disc.do", {
            filter: '${param.filter == null ? "" : param.filter}',
            name: '${param.name == null ? "" : param.name}'
        }, function (data) {
            cache.data = data;
            handle_data(data);
            render_page(data);
        });
    }

    function handle_data(data) {
        $(data).each(function () {
            navbar.add_postion(this.key, this.title);
        });
    }

    function render_page(data) {
        post_before_render();
        if (device.is_small()) {
            $("#content").html(render("tables-tmpl-small", {lists: data}));
        } else {
            $("#content").html(render("tables-tmpl", {lists: data}));
        }
        post_after_render();
    }

    function post_before_render() {
        table.save_status();
        offset.save();
    }

    function post_after_render() {
        table.sorter("table.table.sorter");
        table.load_status();
        setTimeout(function () {
            if (cache.is_first("restore")) {
                offset.restore();
            } else {
                offset.load();
            }
        }, 20);
        if (!device.is_small()) {
            render_profile([
                {title: "默认中文模式", checked: ["index", "arnk", "srnk", "cupt", "sday", "title"]},
                {title: "默认日文模式", checked: ["index", "arnk", "srnk", "cupt", "japan"]},
                {title: "Sakura标准模式", checked: ["index", "srnk", "cupt", "cubk", "release", "title"]},
                {
                    title: "Amazon排名模式",
                    checked: ["index", "arnk", "srnk", "title", "rank1", "rank2", "rank3", "rank4", "rank5"]
                }
            ]);
        }
    }
</script>
</body>
</html>