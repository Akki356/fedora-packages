
    <div class="list header-list">
        <script type="text/javascript">
            function _text_filter(text) {
                var results = $("<div />");
                var ul = $("<ul />");
                results.append(ul);
                var v=text.split('\n');
                for (i in v) {
                    line = v[i];

                    ul.append("<li>" + line + "</li>");
                }

                return results.html();
            }
        </script>
        <table id="${id}">
            <thead>
              <th>Version</th>
              <th>Changes</th>
              <th>Author</th>
              <th>Date</th>
            </thead>
            <tbody class="rowtemplate">
                    <tr>
                        <td>
                            @{version}
                        </td>
                        <td>
                            @{text:filter(_text_filter)}
                        </td>
                        <td>
                            @{author}<br/>
                            <a href="mailto:@{email}">&lt;@{email}&gt;</a>
                        </td>
                        <td>
                            @{display_date}
                        </td>
                    </tr>
                </tbody>
        </table>
        <div id="grid-controls" if="total_rows == 0">
            <div class="message template" id="info_display" >
                This package has no Changelog entries
            </div>
        </div>
        <div id="grid-controls" if="visible_rows >= total_rows && total_rows != 0">
            <div class="message template" id="info_display" >
               Viewing all Changelog entries
            </div>
        </div>
        <div id="grid-controls" if="visible_rows < total_rows">
            <div class="message template" id="info_display" >
               Viewing @{visible_rows} of @{total_rows} Changelog entries
            </div>
            <div class="pager" id="pager" type="numeric" ></div>

            <div class="pager template" id="pager" type="more_link">
               <a href="@{more_link}?package=@{filters:index('package')}" moksha_url="dynamic">View more entries &gt;</a>
            </div>
        </div>
    </div>