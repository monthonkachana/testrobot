*** Settings ***
Resource  ../resources/imports.robot
Library    Collections
Library    Process

*** Variables ***

*** Keywords ***
ดึงข้อมูลของบุคคลเคยออกรายงานมาก่อนหน้าของเงื่อนไขที่ ${CONDITION_ID} ได้แก่ '${BANK_LIST}'
    [Documentation]    เก็บแบงค์
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    connect to cfr database
    @{bank_words} =  Split String    ${BANK_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    FOR    ${i}    IN RANGE    ${horse_count}
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        get gray list from database with bank '${horse_recv}' and conditon no '${CONDITION_ID}'
        ${person_id}=    decrypt cfr string '${PERSONAL_ID}'
        ${person_acc}=    decrypt cfr string '${ACCOUNT_NUMBER}'
        ${person_name}=    decrypt cfr string '${NAME}'
        ${person_surename}=    decrypt cfr string '${SURNAME}'

        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_recv}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${person_id}    horse_type=${ACCOUNT_TYPE}    horse_name=${person_name}    horse_lastname=${person_surename}    horse_account_no=${person_acc}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_recv}=${horse_dict}
        set test variable    ${horse_list_dict}

    END

ดึงข้อมูลของบุคคลเคยออกรายงานมาก่อนหน้าของเงื่อนไขที่ ${CONDITION_ID} ได้แก่ '${BANK_LIST}' account type '${ACC_TYPE}'
    [Documentation]    เก็บแบงค์
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    connect to cfr database
    @{bank_words} =  Split String    ${BANK_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    FOR    ${i}    IN RANGE    ${horse_count}
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        get gray list from database with bank '${horse_recv}' and conditon no '${CONDITION_ID}' account type '${ACC_TYPE}'
        ${person_id}=    decrypt cfr string '${PERSONAL_ID}'
        ${person_acc}=    decrypt cfr string '${ACCOUNT_NUMBER}'
        ${person_name}=    decrypt cfr string '${NAME}'
        ${person_surename}=    decrypt cfr string '${SURNAME}'

        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_recv}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${person_id}    horse_type=${ACCOUNT_TYPE}    horse_name=${person_name}    horse_lastname=${person_surename}    horse_account_no=${person_acc}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_recv}=${horse_dict}
        set test variable    ${horse_list_dict}

    END

ดึงข้อมูลของบุคคลเคยออกรายงานมาก่อนหน้าของเงื่อนไขที่ ${CONDITION_ID} ได้แก่ '${BANK_LIST}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}'
    [Documentation]    เก็บแบงค์
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    connect to cfr database
    @{bank_words} =  Split String    ${BANK_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    FOR    ${i}    IN RANGE    ${horse_count}
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        get gray list from database with bank '${horse_recv}' and conditon no '${CONDITION_ID}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}'
        ${person_id}=    decrypt cfr string '${PERSONAL_ID}'
        ${person_acc}=    decrypt cfr string '${ACCOUNT_NUMBER}'
        ${person_name}=    decrypt cfr string '${NAME}'
        ${person_surename}=    decrypt cfr string '${SURNAME}'

        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_recv}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${person_id}    horse_type=${ACCOUNT_TYPE}    horse_name=${person_name}    horse_lastname=${person_surename}    horse_account_no=${person_acc}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_recv}=${horse_dict}
        set test variable    ${horse_list_dict}

    END

ดึงข้อมูลของบุคคลเคยออกรายงานมาก่อนหน้าของเงื่อนไขที่ ${CONDITION_ID} ได้แก่ '${BANK_LIST}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}' SP
    [Documentation]    เก็บแบงค์
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    connect to cfr database
    @{bank_words} =  Split String    ${BANK_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    FOR    ${i}    IN RANGE    ${horse_count}
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        get gray list from database with bank '${horse_recv}' and conditon no '${CONDITION_ID}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}' SP
        ${person_id}=    decrypt cfr string '${PERSONAL_ID}'
        ${person_acc}=    decrypt cfr string '${ACCOUNT_NUMBER}'
        ${person_name}=    decrypt cfr string '${NAME}'
        ${person_surename}=    decrypt cfr string '${SURNAME}'

        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_recv}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${person_id}    horse_type=${ACCOUNT_TYPE}    horse_name=${person_name}    horse_lastname=${person_surename}    horse_account_no=${person_acc}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_recv}=${horse_dict}
        set test variable    ${horse_list_dict}

    END


ดึงข้อมูลของบุคคลเคยออกรายงานมาก่อนหน้าของเงื่อนไขที่ ${CONDITION_ID} ได้แก่ '${BANK_LIST}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}' Negative
    [Documentation]    เก็บแบงค์
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    connect to cfr database
    @{bank_words} =  Split String    ${BANK_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    FOR    ${i}    IN RANGE    ${horse_count}
        ${horse_recv}=    set variable    ${bank_words}[${i}]
    get gray list from database with bank '${BANK_NAME}' and conditon no '${CONDITION_ID}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}' Negative
       ${sql}=   catenate Negative
        ${person_id}=    decrypt cfr string '${PERSONAL_ID}'
        ${person_acc}=    decrypt cfr string '${ACCOUNT_NUMBER}'
        ${person_name}=    decrypt cfr string '${NAME}'
        ${person_surename}=    decrypt cfr string '${SURNAME}'

        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_recv}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${person_id}    horse_type=${ACCOUNT_TYPE}    horse_name=${person_name}    horse_lastname=${person_surename}    horse_account_no=${person_acc}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_recv}=${horse_dict}
        set test variable    ${horse_list_dict}

    END

# DATABASE
connect to cfr database
    [Documentation]    เก็บแบงค์
    ${db_connect}    connect    ${db.username}    ${db.password}    ${db.conn_str}
    set test variable    ${db_connect}

connect to cfr database horse
    [Documentation]    เก็บแบงค์
    ${db_connect}    connect    ${dbapp.username}    ${dbapp.password}    ${dbapp.conn_str}
    set test variable    ${db_connect}

connect to cfr database horse uat
    [Documentation]    เก็บแบงค์
    ${db_connect}    connect    ${dbuat.username}    ${dbuat.password}    ${dbuat.conn_str}
    set test variable    ${db_connect}

get gray list from database with bank '${BANK_NAME}' and conditon no '${RULE_ID}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}'

    [Documentation]    เก็บแบงค์
       ${sql}=   catenate
        ...     SELECT  DISTINCT FA.PERSONAL_ID,FA.ACCOUNT_NUMBER,ACCOUNT_TYPE,FAAFR.RULE_ID,FIRST_NAME,LAST_NAME,BANK_CODE
        ...     FROM   FRAUD_ACCOUNT FA
        ...     LEFT JOIN FRAUD_ACCOUNT_APPLY_WARRANT FAW ON FA.ID = FAW.ACCOUNT_ID
        ...     JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FA.ID = FAAFR.ACCOUNT_ID
        ...     WHERE  FAAFR.RULE_ID = '${RULE_ID}'
        ...     and FAW.WARRANT_ID IS NULL 
        # ...     and PERSONAL_ID = 'J7HTRk9p1pA+gPwD/dLlLx7Sq5gBWA+rBoCRL8fwBjE='
        # ...     and ACCOUNT_NUMBER = 'BsgztAS+AmICVMSpVkWbqZTaa3EnVgJfTnlY2Sovd3o='
        ...     and FAAFR.RULE_ID NOT IN (${NO_CONDITION})
        ...     and ACCOUNT_TYPE = '${ACC_TYPE}'
        ...     and BANK_CODE = '${${BANK_NAME}.bank_code}'

        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${data_lenght}=    Get Length    ${query}
        ${record}=    random_number_with_lenght    ${data_lenght}    ${1}
        ${record_num}=    Convert To Integer    ${record} 
        ${result}=   set variable    ${query[${record_num}]}
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL_ID]
        ${ACCOUNT_NUMBER}=        set variable    ${result}[ACCOUNT_NUMBER]
        ${ACCOUNT_TYPE}=        set variable    ${result}[ACCOUNT_TYPE]
        ${NAME}=       set variable    ${result}[FIRST_NAME]
        ${SURNAME}=          set variable    ${result}[LAST_NAME]
        set test variable    ${PERSONAL_ID}
        set test variable    ${ACCOUNT_NUMBER}
        set test variable    ${ACCOUNT_TYPE}
        set test variable    ${NAME}
        set test variable    ${SURNAME}

get gray list from database with bank '${BANK_NAME}' and conditon no '${RULE_ID}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}' SP
    [Documentation]    Test Case SUBMIT
       ${sql}=   catenate
        ...     SELECT  DISTINCT FA.PERSONAL_ID,FA.ACCOUNT_NUMBER,ACCOUNT_TYPE,FAAFR.RULE_ID,FIRST_NAME,LAST_NAME,BANK_CODE
        ...     FROM   FRAUD_ACCOUNT FA
        ...     LEFT JOIN FRAUD_ACCOUNT_APPLY_WARRANT FAW ON FA.ID = FAW.ACCOUNT_ID
        ...     JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FA.ID = FAAFR.ACCOUNT_ID
        ...     WHERE  FAAFR.RULE_ID = '${RULE_ID}'
        ...     and FAW.WARRANT_ID IS NULL 
        ...     and FAAFR.RULE_ID NOT IN (${NO_CONDITION})
        ...     and ACCOUNT_TYPE = '${ACC_TYPE}'
        ...     and PERSONAL_ID not like 'tlMWOOKqiouC0yaKROeJA4JA7R6hVA1afLHkt61QuIQ='
        ...     and PERSONAL_ID not like 'EU+oHaG1cDLSI5iL60+buf28AP005O+dnVhNDwNf5Hk='
        ...     and BANK_CODE = '${${BANK_NAME}.bank_code}'

        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${data_lenght}=    Get Length    ${query}
        ${record}=    random_number_with_lenght    ${data_lenght}    ${1}
        ${record_num}=    Convert To Integer    ${record} 
        ${result}=   set variable    ${query[${record_num}]}
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL_ID]
        ${ACCOUNT_NUMBER}=        set variable    ${result}[ACCOUNT_NUMBER]
        ${ACCOUNT_TYPE}=        set variable    ${result}[ACCOUNT_TYPE]
        ${NAME}=       set variable    ${result}[FIRST_NAME]
        ${SURNAME}=          set variable    ${result}[LAST_NAME]
        set test variable    ${PERSONAL_ID}
        set test variable    ${ACCOUNT_NUMBER}
        set test variable    ${ACCOUNT_TYPE}
        set test variable    ${NAME}
        set test variable    ${SURNAME}


get gray list from database with bank '${BANK_NAME}' and conditon no '${CONDITION_ID}' account type '${ACC_TYPE}' ยกเว้นเงื่อนไข '${NO_CONDITION}' Negative
    [Documentation]    Test Case SUBMIT
       ${sql}=   catenate
        ...     SELECT  DISTINCT FA.PERSONAL_ID,FA.ACCOUNT_NUMBER,ACCOUNT_TYPE,FAAFR.RULE_ID,FIRST_NAME,LAST_NAME,BANK_CODE
        ...     FROM   FRAUD_ACCOUNT FA
        ...     LEFT JOIN FRAUD_ACCOUNT_APPLY_WARRANT FAW ON FA.ID = FAW.ACCOUNT_ID
        ...     JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FA.ID = FAAFR.ACCOUNT_ID
        ...     WHERE  FAAFR.RULE_ID IN (${CONDITION_ID})
        ...     and FAAFR.RULE_ID NOT IN (${NO_CONDITION})
        ...     and ACCOUNT_TYPE = '${ACC_TYPE}'
        ...     and BANK_CODE = '${${BANK_NAME}.bank_code}'

        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${data_lenght}=    Get Length    ${query}
        ${record}=    random_number_with_lenght    ${data_lenght}    ${1}
        ${record_num}=    Convert To Integer    ${record} 
        ${result}=   set variable    ${query[${record_num}]}
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL_ID]
        ${ACCOUNT_NUMBER}=        set variable    ${result}[ACCOUNT_NUMBER]
        ${ACCOUNT_TYPE}=        set variable    ${result}[ACCOUNT_TYPE]
        ${NAME}=       set variable    ${result}[FIRST_NAME]
        ${SURNAME}=          set variable    ${result}[LAST_NAME]
        set test variable    ${PERSONAL_ID}
        set test variable    ${ACCOUNT_NUMBER}
        set test variable    ${ACCOUNT_TYPE}
        set test variable    ${NAME}
        set test variable    ${SURNAME}

get gray list from database with bank '${BANK_NAME}' and conditon no '${RULE_ID}'
    [Documentation]    Test Case SUBMIT
       ${sql}=   catenate
        ...     SELECT distinct PERSONAL,ACCOUNT_NUMBER,ACCOUNT_TYPE,RULE,NAME,SURNAME,BANKCODE,LAST_UPDATE_DATE_TIME 
        ...     from(select distinct MASTER_CASE_ID,SUB_CASE_ID,PARENT_SUB_CASE_ID,FARE.PERSONAL_ID as PERSONAL,
        ...     FARE.RULE_ID as RULE,BANK_CODE as BANKCODE,ACCOUNT_NUMBER,FA.ACCOUNT_TYPE,FP.FIRST_NAME as NAME,
        ...     FP.LAST_NAME as SURNAME, CYCLE_ID as CYCLE,FP.LAST_UPDATE_DATE_TIME,GENERATE_REPORT_DATE_TIME
        ...     from FRAUD_SUB_CASE FSC
        ...     join FRAUD_ACCOUNT FA on  FSC.ACCOUNT_ID = FA.ID
        ...     join FRAUD_PERSON FP on FA.PERSONAL_ID  = FP.PERSONAL_ID
        ...     join FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FSC.ACCOUNT_ID = FAAFR.ACCOUNT_ID
        ...     join FRAUD_ACCOUNT_REPORT FARE on FA.PERSONAL_ID = FARE.PERSONAL_ID
        ...     join FRAUD_REPORT_TIME_CYCLE FRTC on FRTC.ID = FARE.CYCLE_ID
        ...     where BANK_CODE = '${${BANK_NAME}.bank_code}' AND FARE.RULE_ID =${RULE_ID}
        ...     order by LAST_UPDATE_DATE_TIME DESC)
        ...     group by MASTER_CASE_ID,SUB_CASE_ID,PARENT_SUB_CASE_ID, PERSONAL,RULE,BANKCODE,ACCOUNT_NUMBER,ACCOUNT_TYPE,NAME,SURNAME,CYCLE,LAST_UPDATE_DATE_TIME,GENERATE_REPORT_DATE_TIME
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL]
        ${ACCOUNT_NUMBER}=        set variable    ${result}[ACCOUNT_NUMBER]
        ${ACCOUNT_TYPE}=        set variable    ${result}[ACCOUNT_TYPE]
        ${NAME}=       set variable    ${result}[NAME]
        ${SURNAME}=          set variable    ${result}[SURNAME]
        set test variable    ${PERSONAL_ID}
        set test variable    ${ACCOUNT_NUMBER}
        set test variable    ${ACCOUNT_TYPE}
        set test variable    ${NAME}
        set test variable    ${SURNAME}

get gray list from database with bank '${BANK_NAME}' and conditon no '${RULE_ID}' account type '${ACC_TYPE}'
    [Documentation]    Test Case SUBMIT
       ${sql}=   catenate
        ...     SELECT distinct PERSONAL,ACCOUNT_NUMBER,ACCOUNT_TYPE,RULE,NAME,SURNAME,BANKCODE,LAST_UPDATE_DATE_TIME 
        ...     from(select distinct MASTER_CASE_ID,SUB_CASE_ID,PARENT_SUB_CASE_ID,FARE.PERSONAL_ID as PERSONAL,
        ...     FARE.RULE_ID as RULE,BANK_CODE as BANKCODE,ACCOUNT_NUMBER,FA.ACCOUNT_TYPE,FP.FIRST_NAME as NAME,
        ...     FP.LAST_NAME as SURNAME, CYCLE_ID as CYCLE,FP.LAST_UPDATE_DATE_TIME,GENERATE_REPORT_DATE_TIME
        ...     from FRAUD_SUB_CASE FSC
        ...     join FRAUD_ACCOUNT FA on  FSC.ACCOUNT_ID = FA.ID
        ...     join FRAUD_PERSON FP on FA.PERSONAL_ID  = FP.PERSONAL_ID
        ...     join FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FSC.ACCOUNT_ID = FAAFR.ACCOUNT_ID
        ...     join FRAUD_ACCOUNT_REPORT FARE on FA.PERSONAL_ID = FARE.PERSONAL_ID
        ...     join FRAUD_REPORT_TIME_CYCLE FRTC on FRTC.ID = FARE.CYCLE_ID
        ...     where BANK_CODE = '${${BANK_NAME}.bank_code}' AND FARE.RULE_ID =${RULE_ID} AND ACCOUNT_TYPE = '${ACC_TYPE}'
        ...     order by LAST_UPDATE_DATE_TIME DESC)
        ...     group by MASTER_CASE_ID,SUB_CASE_ID,PARENT_SUB_CASE_ID, PERSONAL,RULE,BANKCODE,ACCOUNT_NUMBER,ACCOUNT_TYPE,NAME,SURNAME,CYCLE,LAST_UPDATE_DATE_TIME,GENERATE_REPORT_DATE_TIME
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL]
        ${ACCOUNT_NUMBER}=        set variable    ${result}[ACCOUNT_NUMBER]
        ${ACCOUNT_TYPE}=        set variable    ${result}[ACCOUNT_TYPE]
        ${NAME}=       set variable    ${result}[NAME]
        ${SURNAME}=          set variable    ${result}[SURNAME]
        set test variable    ${PERSONAL_ID}
        set test variable    ${ACCOUNT_NUMBER}
        set test variable    ${ACCOUNT_TYPE}
        set test variable    ${NAME}
        set test variable    ${SURNAME}

qeury person '${BANK_CASE_ID}'
    [Documentation]    Test Case SUBMIT
    connect to cfr database horse
       ${sql}=   catenate
        ...    select ID from PERSON where BANK_CASE_ID = '${BANK_CASE_ID}'
        ...    order by UPDATE_DATETIME
        # ...    select ID from PERSON where BANK_CASE_ID = '25670903KBNK01612'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        Set Test Variable        ${query}
        ${data_lenght}=    Get Length    ${query}
           FOR    ${index}    IN RANGE    0    ${data_lenght}
            ${IDALL}=    Get From List    ${query}    ${index}
                 ${ID}=    Get From Dictionary    ${IDALL}    ID
                Set Test Variable  ${ID}
                ${sql}=   catenate  SELECT PERSON_ID, COUNT(*) AS TOTAL_PERSON_BY_ACCOUNT FROM BANKACCOUNT
                    ...    where PERSON_ID = '${ID}' and BANK_CASE_ID = '${BANK_CASE_ID}'
                    ...    GROUP BY PERSON_ID HAVING COUNT(*) > 1
                 ${query1}=   query_all     ${db_connect}     ${sql}  
                        ${length}=   Get Length    ${query1}
                            Run Keyword If    ${length} == 0    Query 0 data
                            Run Keyword If    ${length} > 0     Query data person id
                            
            END

qeury person '${BANK_CASE_ID}' to bank account
    [Documentation]    Test Case SUBMIT
    connect to cfr database horse
       ${sql}=   catenate
        ...    select ID from PERSON where BANK_CASE_ID = '${BANK_CASE_ID}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        Set Test Variable        ${query}
        ${data_lenght}=    Get Length    ${query}
        set test variable      ${Total_person}        ${data_lenght} 
    Query data person id2

query person from cleansing
    [Documentation]    Test Case SUBMIT
     connect to cfr database
       ${sql}=   catenate    Select distinct MASTER_CASE_ID from FRAUD_ACCOUNT_EXPORT FAE
        ...    left join CFAS_SIT.FRAUD_ACCOUNT FA on FAE.ACCOUNT_NUMBER = FA.ACCOUNT_NUMBER and FAE.BANK_CODE = FA.BANK_CODE
    ...    join CFAS_SIT.FRAUD_SUB_CASE FSC on FA.ID = FSC.ACCOUNT_ID
    ...    where IMPORT_FLAG is not null
    ...    group by MASTER_CASE_ID,FAE.ACCOUNT_NUMBER,FAE.BANK_CODE,IMPORT_FLAG
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        Set Test Variable        ${query}
    Set Test Variable    ${ALL_MASTER_CASE}    ${query}

    
Query 0 data
    [Documentation]    Test Case SUBMIT
    set test variable   ${TOTAL_PERSON_BY_ACCOUNT}    0
Query data person id
    [Documentation]    Test Case SUBMIT
    connect to cfr database horse
       ${sql}=   catenate
        ...    select ID from PERSON where BANK_CASE_ID = '${BANK_CASE_ID}'
        ...    order by UPDATE_DATETIME
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        Set Test Variable        ${query}
        ${data_lenght}=    Get Length    ${query}
           FOR    ${index}    IN RANGE    0    ${data_lenght}
            ${IDALL}=    Get From List    ${query}    ${index}
                 ${ID}=    Get From Dictionary    ${IDALL}    ID
                Set Test Variable  ${ID}
                            Run Keyword If    '${ID}' == '${DataZero}'    Log  1
                            Run Keyword If    '${ID}' != '${DataZero}'     Query data person id2
            END
Query data person id2
    [Documentation]    Test Case SUBMIT
    connect to cfr database horse
                ${sql}=   catenate  SELECT SUM(TOTAL_PERSON_BY_ACCOUNT)  AS TOTAL_PERSON_BY_ACCOUNT  from(
                ...      SELECT PERSON_ID, COUNT(*) AS TOTAL_PERSON_BY_ACCOUNT FROM BANKACCOUNT
                    ...    where BANK_CASE_ID = '${BANK_CASE_ID}'
                    ...    GROUP BY PERSON_ID HAVING COUNT(*) > 1)
                 ${query1}=   query_all     ${db_connect}     ${sql}
                 set test variable  ${query1}
                ${length_row}=   Get Length    ${query1}
                set test variable    ${Row}  ${length_row}  
                Run Keyword If    '${length_row}' != '0'    Query data person id3
                Run Keyword If    '${length_row}' == '0'    Query 0 data

Query data person id3
    [Documentation]    Test Case SUBMIT
        FOR    ${index}    IN RANGE    0    ${Row}
                ${Data_NotNull}=    Get From List    ${query1}    ${index}
        ${TOTAL_PERSON_BY_ACCOUNT}=    Get From Dictionary    ${Data_NotNull}    TOTAL_PERSON_BY_ACCOUNT    
        set test variable   ${TOTAL_PERSON_BY_ACCOUNT}  
        END


get file aoc DownLoad
    [Documentation]    Test Case SUBMIT
    connect to cfr database
       ${sql}=   catenate    SELECT TEMP_BLOB,DBMS_LOB.SUBSTR(TEMP_BLOB, 4000, 1) AS TEMP_BLOB FROM AOC_TRAILING_REPORT_TRACKER
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        set test variable    ${query} 



Save BLOB To File
    [Documentation]    Test Case SUBMIT
    [Arguments]    ${blob_data}    ${file_path}
    # ใช้ Python Script ผ่าน Run Process เพื่ออ่านและบันทึก BLOB
    Run Process    python    -c    from cx_Oracle import LOB; import sys; blob=sys.argv[1]; path=sys.argv[2]; with open(path, 'wb') as f: f.write(blob.read())    ${blob_data}    ${file_path}
    Log    File saved successfully at ${file_path}


qeury Check Duplicate Person ID
    [Documentation]    Test Case SUBMIT
    connect to cfr database horse
       ${sql}=   catenate
        ...     SELECT  PERSON_ID, COUNT(*) as TOTAL_PERSON FROM BANKACCOUNT GROUP BY PERSON_ID HAVING COUNT(*) > 1
                 ${query1}=   query_all     ${db_connect}     ${sql}
                 set test variable  ${query1}
                ${length_row}=   Get Length    ${query1}
                set test variable    ${Row}  ${length_row}  
                set test variable    ${length_row}  
                Run Keyword If    '${length_row}' != '0'    fail
                Run Keyword If    '${length_row}' == '0'    Success

Success
    [Documentation]    Test Case SUBMIT
    Should Be Equal     '${Row}'    '0'
    Log  Success :: ${length_row}

fail
    [Documentation]    Test Case SUBMIT
    Should Be Equal   ${length_row}    ${Row} 
    log  Fail:: ${length_row}

get Master Case ID Police Case Number ${BankCaseID}
    [Documentation]    Test Case SUBMIT
        IF  '${BankCaseID}' == 'random'
       connect to cfr database
       ${sql}=   catenate
        ...     select FSC.MASTER_CASE_ID as MASTER_CASE_ID from CFAS_SIT.FRAUD_SUB_CASE  FSC
        ...    left join CFRAPP.FRAUDCASE FC on FSC.MASTER_CASE_ID = FC.MASTER_CASE_ID where POLICE_CASE_NUMBER is null and ROWNUM = 1
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${bankcaseid}      ${MASTER_CASE_ID} 
        ELSE 
            set test variable   ${bankcaseid}      ${BankCaseID}
        END

get Master Case ID Police Case Number Null
    [Documentation]    Test Case SUBMIT
       connect to cfr database
       ${sql}=   catenate
        ...     select FSC.MASTER_CASE_ID as MASTER_CASE_ID from CFAS_SIT.FRAUD_SUB_CASE  FSC
        ...    left join CFRAPP.FRAUDCASE FC on FSC.MASTER_CASE_ID = FC.MASTER_CASE_ID where POLICE_CASE_NUMBER is null and ROWNUM = 1
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${bankcaseid}      ${MASTER_CASE_ID} 

get Master Case ID Have Police Case Number 
    [Documentation]    Test Case SUBMIT
       connect to cfr database
       ${sql}=   catenate
        ...     Select FAAW.MASTER_CASE_ID as MASTER_CASE_ID,WARRANT_NUMBER,WARRANT_DATE from FRAUD_ACCOUNT_APPLY_WARRANT  FAAW
        ...    LEFT JOIN CFRAPP.FRAUDCASE FA on FAAW.MASTER_CASE_ID = FA.MASTER_CASE_ID
        ...    where FAAW.WARRANT_ID ='3' and WARRANT_NUMBER IS NOT NULL and ROWNUM = '1'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${WARRANT_NUMBER}=    set variable    ${result}[WARRANT_NUMBER]
        ${WARRANT_DATE}=    set variable    ${result}[WARRANT_DATE]
        set test variable   ${bankcaseid}      ${MASTER_CASE_ID} 
        set test variable   ${WARRANT_NUMBER} 
        set test variable   ${WARRANT_DATE} 

        
Check Response from DB MASTER CASE ID ${MASTER_CASE_ID} AND POLICE CASENUMBER ${POLICE_CASE_NUMBER}
    [Documentation]    Test Case SUBMIT
        Set Test Variable  ${MASTER_CASE_ID}
        Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   5s
        connect to cfr database horse
       ${sql}=   catenate      select MASTER_CASE_ID,POLICE_CASE_NUMBER,CASE_DATE_TIME from FRAUDCASE where MASTER_CASE_ID = '${MASTER_CASE_ID}'and POLICE_CASE_NUMBER = '${POLICE_CASE_NUMBER}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${DB_POLICE_CASE_NUMBER}=    set variable    ${result}[POLICE_CASE_NUMBER]
        ${DB_CASE_DATE_TIME}=    set variable    ${result}[CASE_DATE_TIME]
        set test variable   ${DB_MASTER_CASE_ID}
        set test variable   ${DB_POLICE_CASE_NUMBER}
        set test variable   ${DB_CASE_DATE_TIME}
        Response AOC SUBMIT FILE DB

Check Response from DB MASTER CASE ID ${MASTER_CASE_ID} AND POLICE CASENUMBER ${POLICE_CASE_NUMBER} Update POLICE CASENUMBER (H)
    [Documentation]    Test Case SUBMIT
        Set Test Variable  ${MASTER_CASE_ID}
        Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   5s
        connect to cfr database horse
       ${sql}=   catenate      select MASTER_CASE_ID,POLICE_CASE_NUMBER,CASE_DATE_TIME,UPDATE_DATE_TIME from FRAUDCASE
        ...    where MASTER_CASE_ID = '${MASTER_CASE_ID}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${DB_POLICE_CASE_NUMBER}=    set variable    ${result}[POLICE_CASE_NUMBER]
        ${DB_CASE_DATE_TIME}=    set variable    ${result}[CASE_DATE_TIME]
        ${DB_UPDATE_DATE_TIME}=    set variable    ${result}[UPDATE_DATE_TIME]
        set test variable   ${DB_MASTER_CASE_ID}
        set test variable   ${DB_POLICE_CASE_NUMBER}
        set test variable   ${DB_CASE_DATE_TIME}
        set test variable   ${DB_UPDATE_DATE_TIME}
        Response AOC SUBMIT FILE DB UPDATE (H)

Check Response from DB POLICE CASENUMBER ${POLICE_CASE_NUMBER} Freeze 
    [Documentation]    Test Case SUBMIT
        Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      select WARRANT_NUMBER,ACCOUNT_NUMBER,BANK_CODE,PERSONAL_ID,AMOUNT from FRAUD_ACCOUNT_APPLY_WARRANT FAAW 
        ...    join FRAUD_ACCOUNT FA on FAAW.ACCOUNT_ID = FA.ID
        ...    where WARRANT_NUMBER = '${POLICE_CASE_NUMBER}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${WARRANT_NUMBER}=    set variable    ${result}[WARRANT_NUMBER]
        ${ACCOUNT_NUMBER}=    set variable    ${result}[ACCOUNT_NUMBER]
        ${BANK_CODE}=    set variable    ${result}[BANK_CODE]
        ${AMOUNT}=    set variable    ${result}[AMOUNT]
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL_ID]
        ${DB_ACCOUNT_NUMBER}=  decrypt cfr string '${ACCOUNT_NUMBER}'
        set test variable   ${DB_WARRANT_NUMBER}      ${WARRANT_NUMBER}
        set test variable   ${DB_ACCOUNT_NUMBER}
        set test variable   ${AMOUNT}
        set test variable   ${DB_BANK_CODE}      ${BANK_CODE}
        IF Check Response AOC Freeze Account ${H}

Check Response from DB POLICE CASENUMBER ${POLICE_CASE_NUMBER} UnFreeze ${REF_WARRANT_NUMBER}
    [Documentation]    Test Case SUBMIT
        Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      select WARRANT_ID,WARRANT_NUMBER,REFERENCE_WARRANT_NUMBER from FRAUD_ACCOUNT_APPLY_WARRANT
        ...    where WARRANT_NUMBER = '${POLICE_CASE_NUMBER}' and    REFERENCE_WARRANT_NUMBER = '${REF_WARRANT_NUMBER}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${WARRANT_ID}=    set variable    ${result}[WARRANT_ID]
        ${WARRANT_NUMBER}=    set variable    ${result}[WARRANT_NUMBER]
        ${REFERENCE_WARRANT_NUMBER}=    set variable    ${result}[REFERENCE_WARRANT_NUMBER]
        set test variable   ${DB_WARRANT_ID}      ${WARRANT_ID}
        set test variable   ${DB_WARRANT_NUMBER}      ${WARRANT_NUMBER}
        set test variable   ${DB_REFERENCE_WARRANT_NUMBER}      ${REFERENCE_WARRANT_NUMBER}
        Response AOC UnFreeze Account

Check DB warrant H
    [Documentation]    Test Case SUBMIT
        # Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   10s
        connect to cfr database horse
        log  ${BANK_CASE_ID}
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE     ${result}   
        BuiltIn.Sleep   0.5s 
        ${data_total}=    Get From List   ${BANK_CASE_ID}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${Bank_case_id_req}=         Get From List    ${split_data}    0
        ${Warrant_id_req}=        Get From List    ${split_data}    1
        set test variable      ${Bank_case_id_req}
        set test variable      ${Warrant_id_req}
       ${sql}=   catenate      select MASTER_CASE_ID,POLICE_CASE_NUMBER from FRAUDCASE where MASTER_CASE_ID = '${Bank_case_id_req}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${POLICE_CASE_NUMBER}=    set variable    ${result}[POLICE_CASE_NUMBER]
        set test variable   ${DB_MASTER_CASE_ID}      ${MASTER_CASE_ID}
        set test variable   ${DB_WARRANT_NUMBER}      ${POLICE_CASE_NUMBER}
        Check Result DB bankcaseid and warrant h
        log     ${index}
        END
        

Check Result DB bankcaseid and warrant h
    Should Be Equal As Strings     ${Bank_case_id_req}      ${DB_MASTER_CASE_ID}
    Should Be Equal As Strings     ${Warrant_id_req}     ${DB_WARRANT_NUMBER}


Check Response from DB Request Money Trail ${ticket_id}
    [Documentation]    Test Case SUBMIT
        BuiltIn.Sleep   5s
        connect to cfr database
        ${sql}=   catenate     select TICKET_ID,BANK_CASE_ID,LOG_MESSAGE,RESULT_STATUS from AOC_AUDITLOG where TICKET_ID = '${ticket_id}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_TICKET_ID}=    set variable    ${result}[TICKET_ID]
        ${DB_BANK_CASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        ${DB_LOG_MESSAGE}=    set variable    ${result}[LOG_MESSAGE]
        ${DB_RESULT_STATUS}=    set variable    ${result}[RESULT_STATUS]
        set test variable   ${DB_TICKET_ID}
        set test variable   ${DB_BANK_CASE_ID}
        set test variable   ${DB_LOG_MESSAGE}
        set test variable   ${DB_RESULT_STATUS}
        Response AOC Request Money Trail


        
Response AOC SUBMIT FILE DB
    [Documentation]    Test Case SUBMIT
    Should Be Equal    ${MASTER_CASE_ID}      ${DB_MASTER_CASE_ID}
    Should Be Equal    ${POLICE_CASE_NUMBER}    ${DB_POLICE_CASE_NUMBER}


Response AOC SUBMIT FILE DB UPDATE (H)
    [Documentation]    Test Case SUBMIT
    Should Be Equal    ${MASTER_CASE_ID}      ${DB_MASTER_CASE_ID}
    Should Be Equal    ${warrant_id}    ${DB_POLICE_CASE_NUMBER}
    BuiltIn.Should Not Be Equal   ${WARRANT_NUMBER}      ${DB_POLICE_CASE_NUMBER}
    Log   ${DB_CASE_DATE_TIME}
    BuiltIn.Should Not Be Equal   ${WARRANT_DATE}       ${DB_CASE_DATE_TIME}

Response AOC Request Money Trail
    [Documentation]    Test Case SUBMIT
        Should Be Equal    ${ticketid}        ${DB_TICKET_ID}
        Should Be Equal   ${bankcaseid}        ${DB_BANK_CASE_ID}
        Should Not Be Empty  ${DB_LOG_MESSAGE}
        Should Be Equal  ${DB_RESULT_STATUS}    SUCCESS_NEW_TICKET_ID



IF Check Response AOC Freeze Account ${H}
    [Documentation]    Test Case SUBMIT
   IF  '${H}' == 'Q'
   Response AOC Freeze Account R
   ELSE
    Response AOC Freeze Account
    END

Response AOC UnFreeze Account
    [Documentation]    Test Case SUBMIT
    Should Be Equal    ${4}    ${DB_WARRANT_ID}
    Should Be Equal    ${warrant_id}    ${DB_WARRANT_NUMBER}
    # Should Be Equal    ${ACCOUNT_NUMBER}    ${DB_WARRANT_ID}
    Should Be Equal    ${ref_freeze_warrant}    ${DB_REFERENCE_WARRANT_NUMBER}
    # Should Not Be Empty   ${DB_PERSONAL_ID}
    # Should Be Equal As Strings    ${AMOUNT}    None

Response AOC Freeze Account
    [Documentation]    Test Case SUBMIT
    Should Be Equal    ${warrant_id}    ${DB_WARRANT_NUMBER}
    Should Be Equal    ${ACCOUNT_NUMBER}    ${DB_ACCOUNT_NUMBER}
    Should Be Equal    ${BANK_CODE}    ${DB_BANK_CODE}
    # Should Not Be Empty   ${DB_PERSONAL_ID}
    Should Be Equal As Strings    ${AMOUNT}    None

Response AOC Freeze Account R
    [Documentation]    Test Case SUBMIT
    Should Be Equal    ${warrant_id}    ${DB_WARRANT_NUMBER}
    Should Be Equal    ${ACCOUNT_NUMBER}    ${DB_ACCOUNT_NUMBER}
    Should Be Equal    ${BANK_CODE}    ${DB_BANK_CODE}
    # Should Not Be Empty   ${DB_PERSONAL_ID}
    ${freeze_amount}=   Remove String   ${freeze_amount}   .
    Should Be Equal As Strings     "${AMOUNT}"     ${freeze_amount}


get Account number ${Account} And Bank Code ${ฺBC} 
    [Documentation]    Test Case SUBMIT
    IF  ${Account} == 'Existing'       
       connect to cfr database
       ${sql}=   catenate
        ...     select FSC.MASTER_CASE_ID as MASTER_CASE_ID,WARRANT_ID,WARRANT_NUMBER,ACCOUNT_NUMBER,BANK_CODE from FRAUD_SUB_CASE FSC
        ...    LEFT JOIN FRAUD_ACCOUNT_APPLY_WARRANT FAAW on FSC.MASTER_CASE_ID = FAAW.MASTER_CASE_ID JOIN FRAUD_ACCOUNT FA on FSC.ACCOUNT_ID = FA.ID
        ...    where WARRANT_ID NOT IN (3,4) and FAAW.MASTER_CASE_ID is not null and ROWNUM = 1
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${WARRANT_NUMBER}=    set variable    ${result}[WARRANT_NUMBER]
        ${ACCOUNT_NUMBER}=    set variable    ${result}[ACCOUNT_NUMBER]
        ${BANK_CODE}=    set variable    ${result}[BANK_CODE]
        set test variable   ${bankcaseid}      ${MASTER_CASE_ID} 
        set test variable   ${WARRANT_NUMBER} 
        set test variable   ${ACCOUNT_NUMBER}
        set test variable   ${BANK_CODE}
        ${ACCOUNT_NUMBER}=    decrypt cfr string '${ACCOUNT_NUMBER}'
        set test variable   ${ACCOUNT_NUMBER}
        ELSE IF  ${Account} == 'random'
        ${ACCOUNT_NUMBER}=    create account_no 'random'
        set test variable   ${ACCOUNT_NUMBER}
        ${ฺBankCode}=    create BankCode 'random'
        set test variable   ${BANK_CODE}     ${ฺBankCode} 
        ELSE
        set test variable   ${ACCOUNT_NUMBER}   ${Account}
        set test variable   ${BANK_CODE}     ${ฺBC} 
    END
    
get Account number ${Account} And Bank Code ${ฺBC} Unfreeze ${type}
    [Documentation]    Test Case SUBMIT
    IF  ${Account} == 'Existing'       
       connect to cfr database
       ${sql}=   catenate
        ...     select FSC.MASTER_CASE_ID as MASTER_CASE_ID,WARRANT_ID,WARRANT_NUMBER,ACCOUNT_NUMBER,BANK_CODE from FRAUD_SUB_CASE FSC
        ...    LEFT JOIN FRAUD_ACCOUNT_APPLY_WARRANT FAAW on FSC.MASTER_CASE_ID = FAAW.MASTER_CASE_ID JOIN FRAUD_ACCOUNT FA on FSC.ACCOUNT_ID = FA.ID
        ...    where WARRANT_ID NOT IN (3,4) and FAAW.MASTER_CASE_ID is not null and WARRANT_ID = '${type}' and REFERENCE_WARRANT_NUMBER is null 
        ...    order by FSC.LAST_UPDATE_DATE_TIME asc FETCH FIRST 1 ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${WARRANT_NUMBER}=    set variable    ${result}[WARRANT_NUMBER]
        ${ACCOUNT_NUMBER}=    set variable    ${result}[ACCOUNT_NUMBER]
        ${BANK_CODE}=    set variable    ${result}[BANK_CODE]
        set test variable   ${bankcaseid}      ${MASTER_CASE_ID} 
        set test variable   ${WARRANT_NUMBER} 
        set test variable   ${ref_freeze_warrant}       ${WARRANT_NUMBER}
        set test variable   ${ACCOUNT_NUMBER}
        set test variable   ${BANK_CODE}
        ${ACCOUNT_NUMBER}=    decrypt cfr string '${ACCOUNT_NUMBER}'
        set test variable   ${ACCOUNT_NUMBER}
        ELSE IF  ${Account} == 'random'
        ${ACCOUNT_NUMBER}=    create account_no 'random'
        set test variable   ${ACCOUNT_NUMBER}
        ${ฺBankCode}=    create BankCode 'random'
        set test variable   ${BANK_CODE}     ${ฺBankCode} 
        ELSE
        set test variable   ${ACCOUNT_NUMBER}   ${Account}
        set test variable   ${BANK_CODE}     ${ฺBC} 
    END


Get Data Police Case ${BANKCODE} Number is null ${row_number} and ${personal_type}
    # ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    # set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2  
    # ...    and BA.BANK_CODE = '${BANKCODE}' 
    # ...    and PS.PERSONAL_TYPE = '${personal_type}'
    ...    and CASE_TYPE_ID not in (1) 
    ...    and BA.PROMPTPAY_TYPE not in ('e-wallet') 
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') 
    ...    and FC.MASTER_CASE_ID not like ('%BAS%') 
    ...    and FC.MASTER_CASE_ID not like ('%BOA%') 
    ...    and FC.MASTER_CASE_ID not like ('%KBANK%') 
    ...    and FC.MASTER_CASE_ID not like ('%KBANK%') 
    ...    and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') 
    ...    AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%')  
    ...    and to_char(CREATE_DATE_TIME,'YYYY-MM-DD') <= '2025-01-14'
    ...    OFFSET ${row_number} ROWS FETCH NEXT 5000 ROWS ONLY
    # ...    and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%') AND FC.MASTER_CASE_ID NOT LIKE ('%KKP%')  fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random 'SFTP'
        Create Data add Warrant H
        List data file REQ
        # Get Data account and log ${MASTER_CASE_ID}
          log   ${index}
        END




Get Data Master case id ${row_number} and end row ${END_row_number} 
        # connect to cfr database horse
        connect to cfr database
       ${sql}=   catenate        select MASTER_CASE_ID from CFRAPP.FRAUDCASE FC
        ...    LEFT JOIN AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL DETAIL on FC.MASTER_CASE_ID = DETAIL.BANK_CASE_ID
        ...    where DETAIL.BANK_CASE_ID is null ORDER BY MASTER_CASE_ID
        ...    OFFSET ${row_number} ROWS FETCH NEXT ${END_row_number} ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        Create Data add Money trail
          log   ${index}
        END

Get Data PoliceCaseNumber is null ${row_number} and ${mastercase}
        ${case_list}=  Split String  ${BANK_CASE_ALL}  ,
        ${LEN_DATA}=    Get Length    ${case_list}
        Log To Console   ${LEN_DATA}
        FOR  ${index}    IN RANGE     ${LEN_DATA} 
            ${BANK_CASE_ID}=    Set Variable   ${case_list[${index}]}
            Set Test Variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet') 
    ...    AND FC.MASTER_CASE_ID = '${BANK_CASE_ID}'  
    # ...    AND FC.MASTER_CASE_ID in (${mastercase})  
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random 'SFTP'
        Create Data add Warrant H
        List data file REQ
        Get Data account and log ${MASTER_CASE_ID}
          log   ${index}
        END
        END

SP Get Data PoliceCaseNumber is null ${row_number} and ${mastercase}
        ${case_list}=  Split String  ${BANK_CASE_ALL}  ,
        ${LEN_DATA}=    Get Length    ${case_list}
        Log To Console   ${LEN_DATA}
        FOR  ${index}    IN RANGE     ${LEN_DATA} 
            ${BANK_CASE_ID}=    Set Variable   ${case_list[${index}]}
            Set Test Variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER 
       ...   from FRAUDCASE FC where FC.MASTER_CASE_ID = '${BANK_CASE_ID}'  
    # ...    AND FC.MASTER_CASE_ID in (${mastercase})  
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random 'SFTP'
        Create Data add Warrant H
        List data file REQ
        Get Data account and log ${MASTER_CASE_ID}
          log   ${index}
        END
        END


Get Data account and log ${MASTER_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,ACCOUNT_NUMBER,BANK_CODE,ps.PERSONAL_ID,SUB_CASE_RANK 
       ...   from FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet') and FC.MASTER_CASE_ID ='${MASTER_CASE_ID}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${ACCOUNT_NUMBER}=    set variable    ${result}[ACCOUNT_NUMBER]
        ${BANK_CODE}=    set variable    ${result}[BANK_CODE]
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL_ID]
        ${ACCOUNT_NUMBER}=  decrypt cfr string '${ACCOUNT_NUMBER}'
        ${PERSONAL_ID}=  decrypt cfr string '${PERSONAL_ID}'
        # set test variable   ${MASTER_CASE_ID}
        set test variable   ${ACCOUNT_NUMBER}
        set test variable   ${PERSONAL_ID}
        # Log    ${NEW_PERSONAL_ID}
        set test variable   ${BANK_CODE}
        Log data Create warrant H
          log   ${index}
        END