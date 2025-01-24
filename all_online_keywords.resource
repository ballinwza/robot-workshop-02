*** Settings ***
Library    SeleniumLibrary
Resource    all_online_variables.resource

*** Keywords ***
เปิดหน้าเว็บบราวเซอร์
    Open Browser    url=${URL}    browser=chrome

เข้าสู่ระบบสมาชิก
    Click Element    locator=dom:document.querySelector('a.btn-allmember-login')
    Input Text    locator=dom:document.querySelector('input[name="email"]')    text=${USERNAME}
    Input Text    locator=dom:document.querySelector('input[name="password"]')    text=${PASSWORD}
    Click Element    locator=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]

ใส่คำค้นหาที่ต้องการแล้วกด Enter
    Wait Until Element Is Visible    locator=//*[@id="search_id_form"]/div/div[1]/input
    Click Element    locator=id:btn-accept-gdpr
    Input Text    locator=dom:document.querySelector('input[name="q"]')    text=${SEARCH_KEYWORD}
    Press Keys    NONE    RETURN

ตรวจสอบว่าพบสินค้าที่ค้นหาในสินค้าชิ้นแรกหรือไม่
    Wait Until Element Is Visible    locator=css:a.productlink
    Element Attribute Value Should Be    locator=css:a.productlink    attribute=title    expected=${EXPECT_PRODUCT_SEARCH}

กดคลิกเลือกสินค้าชิ้นแรก
    Click Element    locator=dom:document.querySelectorAll('div.product-item')[0]

ตรวจสอบข้อมูลสินค้าที่คลิกเลือก
    Wait Until Element Is Visible    locator=id:title-product
    Element Should Contain    locator=id:title-product    expected=ยำยำช้างน้อย รสบาร์บีคิว 120 กรัม (20 กรัม X 6 ซอง)

เพิ่มจำนวนสินค้าเป็น 5 ชิ้น แล้วกดปุ่มซื้อเลย
    Click Element    locator=//*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]
    Click Element    locator=//*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]
    Click Element    locator=//*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]
    Click Element    locator=//*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]
    Click Button    locator=dom:document.querySelector('button.buy-now')

คลิกเลือกจัดส่งตามที่อยู่
    Wait Until Element Is Visible    locator=dom:document.querySelector('[href="#address"]')
    Click Element    locator=dom:document.querySelector('[href="#address"]')

กรอกข้อมูลที่อยู่สำหรับจัดส่ง
    Click Element    locator=//*[@id="addressbook"]/div/div[2]/div[2]
    Wait Until Element Is Visible    locator=id:sp-addr-new
    Wait Until Element Is Visible    locator=id:new-address-name
    Input Text    locator=id:new-address-name    text=${FIRST_NAME}
    Wait Until Element Is Visible    locator=id:new-address-lastname
    Input Text    locator=id:new-address-lastname    text=${LAST_NAME}
    Wait Until Element Is Visible    locator=id:new-address-mobile
    Input Text    locator=id:new-address-mobile    text=${PHONE_NUMBER}
    Wait Until Element Is Visible    locator=id:new-address-addrno
    Input Text    locator=id:new-address-addrno    text=${ADDRESS_NUMBER}
    Wait Until Element Is Visible    locator=id:new-address-moo
    Input Text    locator=id:new-address-moo    text=${ADDRESS_MOO}
    Wait Until Element Is Visible    locator=id:new-address-province
    Select From List By Label    id:new-address-province    ${ADDRESS_PROVINCE}
    Wait Until Element Is Visible    locator=id:new-address-district
    Select From List By Label    id:new-address-district    ${ADDRESS_DISTRICT}
    Wait Until Element Is Visible    locator=id:new-address-sub-district
    Select From List By Label    id:new-address-sub-district    ${ADDRESS_SUB_DISTRICT}
    
ตรวจสอบข้อมูลสำหรับการจัดส่งที่กรอกไว้
    Wait Until Page Contains    text=${FIRST_NAME}
    Wait Until Page Contains    text=${LAST_NAME}
    Wait Until Page Contains    text=${PHONE_NUMBER}
    Wait Until Page Contains    text=${ADDRESS_NUMBER}
    Wait Until Page Contains    text=${ADDRESS_MOO}
    Sleep    time_=2
    Click Element    locator=id:continue-payment-btn

เลือกชำระเงินด้วยบัตรเครดิต
    Wait Until Element Is Visible    locator=id:payment-options
    Click Element    locator=//*[@id="payment-options"]/div[1]
    Wait Until Element Is Visible    locator=dom:document.querySelector('#payment-options > div.active')

ตรวจสอบข้อมูลการสั่งซื้อ
    Wait Until Element Is Visible    locator=id:js-invoice-details-tbody
    Click Element    locator=id:free-item-arrow-top
    Wait Until Element Is Visible    locator=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[1]/td/div[2]
    Element Should Contain    locator=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[1]/td/div[2]/span    expected=${EXPECT_PAYMENT_CLIENT_DETAIL} 
    Element Should Contain    locator=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[1]/td/div[2]/span    expected=${EXPECT_PAYMENT_PHONE}
    Element Should Contain    locator=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]    expected=${EXPECT_PAYMENT_PRODUCT_DETAIL}
    Element Should Contain    locator=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[3]    expected=${EXPECT_PAYMENT_QUANTITY_DETAIL}
    Element Should Contain    locator=//*[@id="js-invoice-details-tbody"]/tr[1]/td[2]/b    expected=${EXPECT_PAYMENT_PRICE_DETAIL}
    Element Should Contain    locator=//*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b    expected=${EXPECT_PAYMENT_SHIPPING_PRICE_DETAIL}
    Element Should Contain    locator=id:totalAmount    expected=${EXPECT_PAYMENT_TOTAL_PRICE_DETAIL}
    Element Should Contain    locator=//*[@id="js-invoice-details-tbody"]/tr[17]/td[2]/b    expected=${EXPECT_PAYMENT_POINT_DETAIL}

กดสั่งซื้อ
    Click Element    locator=dom:document.querySelector('button[type="submit"]')

ตรวจสอบข้อมูลการชำระเงิน
    Wait Until Element Is Visible    locator=//*[@id="csModalContent"]/div[3]/div[2]/div[3]/span[2]
    Element Should Contain    locator=//*[@id="csModalContent"]/div[3]/div[2]/div[3]/span[2]    expected=${EXPECT_PAYMENT_TOTAL_PRICE_DETAIL}

กรอกข้อมูลบัตรเครดิต
    Input Text    locator=id:cardName    text=${EXPECT_PAYMENT_CARD_NAME}
    Input Text    locator=id:cardNumber    text=${EXPECT_PAYMENT_CARD_NUMBER}
    Input Text    locator=id:expiryDate    text=${EXPECT_PAYMENT_EXPIRE_DATE}
    Input Text    locator=id:cvCode    text=${EXPECT_PAYMENT_CV_CODE}
