#!/usr/bin/python3

def perform_click(browser):
    tab = browser.new_tab()

    # def loading_finished(**kwargs):
    #     print "[loading finished]"
    #
    # # when HTTP request has finished loading
    # tab.set_listener("Network.loadingFinished", loading_finished)

    tab.start()

    # call method
    # tab.Network.enable()
    tab.Network.enable()
    tab.Page.enable()
    tab.Runtime.enable()

    def dom_content_event_fired(**kwargs):
        print("[content] dom content event fired")
        tab.DOM.enable()
        root = tab.DOM.getDocument()
        root_node_id = root.get('root', {}).get('nodeId', '')
        # 找到输入框
        input_box = tab.DOM.querySelector(nodeId=root_node_id, selector='#kw')
        # tab.DOM.setNodeValue(nodeId=input_box, value='hello')
        tab.Runtime.evaluate(expression='document.getElementById("kw").value="Chrome"', )
        # 找到搜索按钮
        search_btn = tab.DOM.querySelector(nodeId=root_node_id, selector='#su')
        remote_node = tab.DOM.resolveNode(nodeId=search_btn.get('nodeId', ''))
        # 执行点击
        tab.Runtime.callFunctionOn(functionDeclaration='(function() { this.click(); })',
                                   objectId=remote_node.get('object', {}).get('objectId', {}))
        tab.wait(3)
        # 输出结果
        html = tab.Runtime.evaluate(expression="document.documentElement.outerHTML")
        html_value = html.get('result', {}).get('value', '').encode('utf-8')
        soup = BeautifulSoup(html_value, 'html.parser')
        l = soup.select('h3 > a')
        for result in l:
            print(result.text)
            print(result['href'])

        screen_base64 = tab.call_method("Page.captureScreenshot")
        image_data = screen_base64.get('data', '')
        with open("test.png", 'wb') as f:
            f.write(image_data.decode('base64'))

        # tab.DOM.performSearch(query='xpath', includeUserAgentShadowDOM=True)
        # stop the tab (stop handle events and stop recv message from chrome)
        tab.stop()

        # close tab
        browser.close_tab(tab)

    tab.set_listener("Page.domContentEventFired", dom_content_event_fired)

    # tab.call_method("Page.reload", ignoreCache=False)
    tab.call_method("Page.navigate", url='https://www.baidu.com', _timeout=5)
    tab.wait(20)