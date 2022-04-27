
unit EditENSettingForDFDecree;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSettingForDFDecreeController,
  ShowDFDocType, ShowDFOrdersCatalog, DFOrdersCatalogController, ShowDFDocPrefix,
  DFDocPrefixController, User2StaffingController, ShowUser2Staffing , Globals,
  ExtCtrls, ShowENEPRen, ShowENWarrant, ENWarrantController,
  ENDepartmentController, ENConsts, ENWarrantTypeController, ShowENDepartment,
  ENDepartmentTypeController;

type
  TfrmENSettingForDFDecreeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDfDocTypeName : TLabel;
    edtDfDocTypeName: TEdit;
    lblCatalogName : TLabel;


  HTTPRIOENSettingForDFDecree: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbDFDocType: TSpeedButton;
    spbDFOrdersCatalog: TSpeedButton;
    edtCatalogName: TEdit;
    GroupBox1: TGroupBox;
    spbPrefix: TSpeedButton;
    lblPrefixSignerTabN: TLabel;
    lblPrefixSignerFio: TLabel;
    edtDfDocPrefixName: TEdit;
    edtPrefixSignerTabN: TEdit;
    edtPrefixSignerFio: TEdit;
    edtPrefixSignerPostInfo: TEdit;
    lblPrefixSignerPostInfo: TLabel;
    GroupBox2: TGroupBox;
    lblInitiatorTabn: TLabel;
    edtInitiatorTabn: TEdit;
    lblInitiatorFio: TLabel;
    edtInitiatorFio: TEdit;
    lblInitiatorPodrName: TLabel;
    edtInitiatorPodrName: TEdit;
    spbInitiator: TSpeedButton;
    HTTPRIOUser2Staffing: THTTPRIO;
    GroupBox3: TGroupBox;
    lblDesignatedTabn: TLabel;
    edtDesignatedTabn: TEdit;
    lblDesignatedFio: TLabel;
    edtDesignatedFio: TEdit;
    lblDesignatedpostInfo: TLabel;
    edtDesignatedpostInfo: TEdit;
    spbDesignatedTabNumber: TSpeedButton;
    HTTPRIOEPRen: THTTPRIO;
    GroupBox4: TGroupBox;
    spbWarrantNumber: TSpeedButton;
    lblWarrantFIO: TLabel;
    edtWarrantFIO: TEdit;
    lblWarrantPosition: TLabel;
    edtWarrantPosition: TEdit;
    spbENDepartment: TSpeedButton;
    edtENDepartmentName: TEdit;
    lblENDepartmentName: TLabel;
    HTTPRIOENDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDFDocTypeClick(Sender: TObject);
    procedure spbDFOrdersCatalogClick(Sender: TObject);
    procedure spbPrefixClick(Sender: TObject);
    procedure spbInitiatorClick(Sender: TObject);
    procedure spbDesignatedTabNumberClick(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

    enwarrantTypeCode : Integer;

end;

var
  frmENSettingForDFDecreeEdit: TfrmENSettingForDFDecreeEdit;
  ENSettingForDFDecreeObj: ENSettingForDFDecree;

implementation

uses DMReportsUnit;


{uses  
    EnergyproController, EnergyproController2, ENSettingForDFDecreeController  ;
}
{$R *.dfm}



procedure TfrmENSettingForDFDecreeEdit.FormShow(Sender: TObject);

var
TempEPRen: EPRenControllerSoapPort;
renFilter : EPRenFilter;
EPRenList: EPRenShortList;
warrant : ENWarrant;
TempENDepartment: ENDepartmentControllerSoapPort;
begin


   DisableControls([edtCode]);
   DisableControls([edtENDepartmentName,edtDfDocTypeName,edtCatalogName,edtDfDocPrefixName,edtPrefixSignerTabN,edtPrefixSignerFio,edtPrefixSignerPostInfo
   ,edtInitiatorTabn,edtInitiatorFio,edtInitiatorPodrName,edtDesignatedTabn,edtDesignatedFio,edtDesignatedpostInfo]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      //edtDfDocTypeCode
      //,
      edtDfDocTypeName
      //,edtCatalogCode
      ,edtCatalogName
      //,edtDfDocPrefixCode
      ,edtDfDocPrefixName
      ,edtPrefixSignerTabN
      ,edtPrefixSignerFio
      ,edtPrefixSignerPostInfo
      ,edtInitiatorTabn
      ,edtInitiatorFio
      ,edtInitiatorPodrName
      //,edtInitiatorPodrCode
      ,edtDesignatedTabn
      ,edtDesignatedFio
      ,edtDesignatedpostInfo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSettingForDFDecreeObj.code);
//    if ( ENSettingForDFDecreeObj.dfDocTypeCode <> Low(Integer) ) then
//       edtDfDocTypeCode.Text := IntToStr(ENSettingForDFDecreeObj.dfDocTypeCode)
//    else
//       edtDfDocTypeCode.Text := '';
    edtDfDocTypeName.Text := ENSettingForDFDecreeObj.dfDocTypeName; 
//    if ( ENSettingForDFDecreeObj.catalogCode <> Low(Integer) ) then
//       edtCatalogCode.Text := IntToStr(ENSettingForDFDecreeObj.catalogCode)
//    else
//       edtCatalogCode.Text := '';
    //MakeMultiline(edtCatalogName.Lines, ENSettingForDFDecreeObj.catalogName);
    edtCatalogName.Text := ENSettingForDFDecreeObj.catalogName;
//    if ( ENSettingForDFDecreeObj.dfDocPrefixCode <> Low(Integer) ) then
//       edtDfDocPrefixCode.Text := IntToStr(ENSettingForDFDecreeObj.dfDocPrefixCode)
//    else
//       edtDfDocPrefixCode.Text := '';
    edtDfDocPrefixName.Text := ENSettingForDFDecreeObj.dfDocPrefixName;
    edtPrefixSignerTabN.Text := ENSettingForDFDecreeObj.prefixSignerTabN; 
    edtPrefixSignerFio.Text := ENSettingForDFDecreeObj.prefixSignerFio; 
    edtPrefixSignerPostInfo.Text := ENSettingForDFDecreeObj.prefixSignerPostInfo; 
    edtInitiatorTabn.Text := ENSettingForDFDecreeObj.initiatorTabn; 
    edtInitiatorFio.Text := ENSettingForDFDecreeObj.initiatorFio;
    // MakeMultiline(edtInitiatorPodrName.Lines, ENSettingForDFDecreeObj.initiatorPodrName);
    edtInitiatorPodrName.Text:= ENSettingForDFDecreeObj.initiatorPodrName;

//    if ( ENSettingForDFDecreeObj.initiatorPodrCode <> Low(Integer) ) then
//       edtInitiatorPodrCode.Text := IntToStr(ENSettingForDFDecreeObj.initiatorPodrCode)
//    else
//       edtInitiatorPodrCode.Text := '';

    edtDesignatedTabn.Text := ENSettingForDFDecreeObj.designatedTabn; 
    edtDesignatedFio.Text := ENSettingForDFDecreeObj.designatedFio; 
    edtDesignatedpostInfo.Text := ENSettingForDFDecreeObj.designatedpostInfo;


     if ENSettingForDFDecreeObj.departmentRef <> nil then
        if ENSettingForDFDecreeObj.departmentRef.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtENDepartmentName.Text := TempENDepartment.getObject(ENSettingForDFDecreeObj.departmentRef.code).shortName;
        end;

     if  ENSettingForDFDecreeObj.responsRef.code  <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENSettingForDFDecreeObj.responsRef.code);

      edtWarrantFIO.Text := warrant.warrantFIO;
      edtWarrantPosition.Text := warrant.warrantPosition;
      
    end;


  end;
end;



procedure TfrmENSettingForDFDecreeEdit.spbDesignatedTabNumberClick(
  Sender: TObject);
var
  cehnazv : string;
  userFilter : User2StaffingFilter;
  frmUser2StaffingShow : TfrmUser2StaffingShow;
  TempUser2Staffing : User2StaffingControllerSoapPort;
  user2StaffArr : User2StaffingController.ArrayOfInteger;
  user2StaffingObj : User2StaffingShort;
  user2StaffFilter : User2StaffingFilter;
begin
  inherited;
  cehnazv := '';
  TempUser2Staffing := HTTPRIOUser2Staffing as User2StaffingControllerSoapPort;

  user2StaffFilter := User2StaffingFilter.Create;
  SetNullIntProps(user2StaffFilter);
  SetNullXSProps(user2StaffFilter);

  user2StaffFilter.conditionSQL := ' user2staffing.usercode = (select s.usercode from user2staffing s, auth_user u ' +
    ' where u.user_code = s.usercode and u.user_name = ''' + HTTPRIOUser2Staffing.HTTPWebNode.UserName + ''')';

  user2StaffArr := TempUser2Staffing.getScrollableFilteredCodeArray(user2StaffFilter, 0, -1);

  if High(user2StaffArr) > -1 then
    user2StaffingObj := TempUser2Staffing.getShortObject(user2StaffArr[0]);

  if (user2StaffingObj <> nil) then
  begin
    cehnazv := user2StaffingObj.cehnazv;
  end;

  userFilter := User2StaffingFilter.Create();
  SetNullXSProps(userFilter);
  SetNullIntProps(userFilter);

  if (cehnazv <> '') then
    userFilter.conditionSQL := ' user2staffing.cehnazv = ''' + cehnazv + '''' +
      ' and user2staffing.usercode in ( ' +
      ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')'
  else
    userFilter.conditionSQL := ' user2staffing.usercode in ( ' +
      ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')';

  userFilter.orderBySQL := ' fio';

  frmUser2StaffingShow := TfrmUser2StaffingShow.Create(Application, fmNormal, userFilter);
  try
    DisableActions([frmUser2StaffingShow.actInsert, frmUser2StaffingShow.actEdit,
      frmUser2StaffingShow.actDelete, frmUser2StaffingShow.actView]);

    with frmUser2StaffingShow do
    if ShowModal = mrOk then
    begin
      try

        ENSettingForDFDecreeObj.designatedTabn := sgUser2Staffing.Cells[1,sgUser2Staffing.Row];

        edtDesignatedTabn.Text := sgUser2Staffing.Cells[1,sgUser2Staffing.Row];

        ENSettingForDFDecreeObj.designatedFio := sgUser2Staffing.Cells[2,sgUser2Staffing.Row];
        edtDesignatedFIO.Text := sgUser2Staffing.Cells[2,sgUser2Staffing.Row];

        ENSettingForDFDecreeObj.designatedPostInfo := sgUser2Staffing.Cells[3,sgUser2Staffing.Row];
        edtDesignatedPostInfo.Text := sgUser2Staffing.Cells[3,sgUser2Staffing.Row];

      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmUser2StaffingShow.Free;
  end;
end;

procedure TfrmENSettingForDFDecreeEdit.spbDFDocTypeClick(Sender: TObject);
var frmDFDocTypeShow: TfrmDFDocTypeShow;
begin
  frmDFDocTypeShow := TfrmDFDocTypeShow.Create(Application, fmNormal);
  try
    with frmDFDocTypeShow do
      if ShowModal = mrOk then
        begin
          try

            ENSettingForDFDecreeObj.dfDocTypeCode := StrToInt(GetReturnValue(sgDFDocType,0));
            edtDfDocTypeName.Text := GetReturnValue(sgDFDocType, 1);
          except
             on EConvertError do Exit;
          end;
        end;
  finally
    frmDFDocTypeShow.Free;
  end;
end;

procedure TfrmENSettingForDFDecreeEdit.spbDFOrdersCatalogClick(Sender: TObject);
var
  frmDFOrdersCatalogShow : TfrmDFOrdersCatalogShow;
begin
  inherited;
frmDFOrdersCatalogShow := TfrmDFOrdersCatalogShow.Create(Application,fmNormal);
  try
    with frmDFOrdersCatalogShow do
    if ShowModal = mrOk then
    begin
      try
       ENSettingForDFDecreeObj.catalogCode:= DFOrdersCatalogShort(tvDep.Selected.Data).code;
       edtCatalogName.Text := DFOrdersCatalogShort(tvDep.Selected.Data).number + ' - '+ DFOrdersCatalogShort(tvDep.Selected.Data).name;

      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmDFOrdersCatalogShow.Free;
  end;
end;

procedure TfrmENSettingForDFDecreeEdit.spbENDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   depFilter : ENDepartmentFilter;
   TempENDepartment : ENDepartmentControllerSoapPort;
begin
   TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
   depFilter := ENDepartmentFilter.Create;
   SetNullXSProps(depFilter);
   SetNullIntProps(depFilter);
//   depFilter.typeRef := ENDepartmentTypeRef.Create;
//   depFilter.typeRef.code := ENDEPARTMENTTYPE_DEPARTMENT;
//   depFilter.parentRef := ENDepartmentRef.Create;
//   depFilter.parentRef.code := ENDEPARTMENT_REM;
    depFilter.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, depFilter);

   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENSettingForDFDecreeObj.departmentRef = nil then
                  ENSettingForDFDecreeObj.departmentRef := ENDepartmentRef.Create();
                  ENSettingForDFDecreeObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
                  edtENDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENSettingForDFDecreeEdit.spbInitiatorClick(Sender: TObject);
var
  cehnazv : string;
  userFilter : User2StaffingFilter;
  frmUser2StaffingShow : TfrmUser2StaffingShow;
  TempUser2Staffing : User2StaffingControllerSoapPort;
  user2StaffArr : User2StaffingController.ArrayOfInteger;
  user2StaffingObj : User2StaffingShort;
  user2StaffFilter : User2StaffingFilter;
begin
  inherited;
  cehnazv := '';
  TempUser2Staffing := HTTPRIOUser2Staffing as User2StaffingControllerSoapPort;

  user2StaffFilter := User2StaffingFilter.Create;
  SetNullIntProps(user2StaffFilter);
  SetNullXSProps(user2StaffFilter);

  user2StaffFilter.conditionSQL := ' user2staffing.usercode = (select s.usercode from user2staffing s, auth_user u ' +
    ' where u.user_code = s.usercode and u.user_name = ''' + HTTPRIOUser2Staffing.HTTPWebNode.UserName + ''')';

  user2StaffArr := TempUser2Staffing.getScrollableFilteredCodeArray(user2StaffFilter, 0, -1);

  if High(user2StaffArr) > -1 then
    user2StaffingObj := TempUser2Staffing.getShortObject(user2StaffArr[0]);

  if (user2StaffingObj <> nil) then
  begin
    cehnazv := user2StaffingObj.cehnazv;
  end;

  userFilter := User2StaffingFilter.Create();
  SetNullXSProps(userFilter);
  SetNullIntProps(userFilter);

  if (cehnazv <> '') then
    userFilter.conditionSQL := ' user2staffing.cehnazv = ''' + cehnazv + '''' +
      ' and user2staffing.usercode in ( ' +
      ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')'
  else
    userFilter.conditionSQL := ' user2staffing.usercode in ( ' +
      ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')';

  userFilter.orderBySQL := ' fio';

  frmUser2StaffingShow := TfrmUser2StaffingShow.Create(Application, fmNormal, userFilter);
  try
    DisableActions([frmUser2StaffingShow.actInsert, frmUser2StaffingShow.actEdit,
      frmUser2StaffingShow.actDelete, frmUser2StaffingShow.actView]);

    with frmUser2StaffingShow do
    if ShowModal = mrOk then
    begin
      try
        ENSettingForDFDecreeObj.initiatorTabn := sgUser2Staffing.Cells[1,sgUser2Staffing.Row];
        edtinitiatorTabn.Text := sgUser2Staffing.Cells[1,sgUser2Staffing.Row];

        ENSettingForDFDecreeObj.initiatorFIO := sgUser2Staffing.Cells[2,sgUser2Staffing.Row];
        edtInitiatorFIO.Text := sgUser2Staffing.Cells[2,sgUser2Staffing.Row];

        ENSettingForDFDecreeObj.initiatorPodrName := sgUser2Staffing.Cells[4,sgUser2Staffing.Row];
        edtInitiatorPodrName.Text := sgUser2Staffing.Cells[4,sgUser2Staffing.Row];

        ENSettingForDFDecreeObj.initiatorPodrCode:= 0;

      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmUser2StaffingShow.Free;
  end;
end;

procedure TfrmENSettingForDFDecreeEdit.spbPrefixClick(Sender: TObject);
var
  frmDFDocPrefixShow : TfrmDFDocPrefixShow;
  prefixFilter : DFDocPrefixFilter;
begin
  inherited;
  prefixFilter := DFDocPrefixFilter.Create;
  SetNullIntProps(prefixFilter);
  SetNullXSProps(prefixFilter);

  frmDFDocPrefixShow := TfrmDFDocPrefixShow.Create(Application, fmNormal, prefixFilter);
  try
    with frmDFDocPrefixShow do
    if ShowModal = mrOk then
    begin
      try
        ENSettingForDFDecreeObj.dfdocprefixcode := StrToInt(sgDFDocPrefix.Cells[0,sgDFDocPrefix.Row]);
        //edtDfDocPrefixCode.Text:= sgDFDocPrefix.Cells[0,sgDFDocPrefix.Row];

        ENSettingForDFDecreeObj.dfDocPrefixName := sgDFDocPrefix.Cells[1,sgDFDocPrefix.Row];
        edtDfDocPrefixName.Text:= sgDFDocPrefix.Cells[1,sgDFDocPrefix.Row];

        ENSettingForDFDecreeObj.prefixSignerTabN := sgDFDocPrefix.Cells[2,sgDFDocPrefix.Row];
        edtPrefixSignerTabN.Text:= sgDFDocPrefix.Cells[2,sgDFDocPrefix.Row];

        ENSettingForDFDecreeObj.prefixSignerFio := sgDFDocPrefix.Cells[3,sgDFDocPrefix.Row];
        edtPrefixSignerFio.Text:= sgDFDocPrefix.Cells[3,sgDFDocPrefix.Row];

        ENSettingForDFDecreeObj.prefixSignerPostInfo := sgDFDocPrefix.Cells[4,sgDFDocPrefix.Row];
        edtPrefixSignerPostInfo.Text := sgDFDocPrefix.Cells[4,sgDFDocPrefix.Row];

      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmDFDocPrefixShow.Free;
  end;
end;

procedure TfrmENSettingForDFDecreeEdit.spbWarrantNumberClick(Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin

     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
     //f.departmentRef := ENDepartmentRef.Create();
     //f.departmentRef.code := ENSettingForDFDecreeObj.renRef.code;

     f.warrantTypeRef := ENWarrantTypeRef.Create;
     f.warrantTypeRef.code := ENConsts.ENWARRANT_TYPE_DECREE_RESPONS;

     if ENSettingForDFDecreeObj.departmentRef <> nil then
       if ENSettingForDFDecreeObj.departmentRef.code <> LOW_INT then
       f.conditionSQL :=
       ' endepartment.code in (select array2items(string_to_array(getdepartmentcodesdown( '
        + IntToStr(ENSettingForDFDecreeObj.departmentRef.code) +' ),' + chr(39) + ',' + Chr(39)+ '))::double precision)';

     if Length(f.conditionSQL) = 0 then
     f.conditionSQL := '  warrantstatusrefcode = 0'
     else
     f.conditionSQL := f.conditionSQL + ' and warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     frmENWarrantShow.Caption:='Відповідальна особа';
     DisableActions([frmENWarrantShow.actNoFilter , frmENWarrantShow.actDelete]);
     frmENWarrantShow.enwarrantTypeCode :=  ENConsts.ENWARRANT_TYPE_DECREE_RESPONS;

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENSettingForDFDecreeObj.responsRef:= ENWarrantRef.Create();
                 ENSettingForDFDecreeObj.responsRef.code:= StrToInt(GetReturnValue(sgENWarrant,0));
                 //ENServicesObjectObj.warrantRef := ENWarrantRef.Create();
                 //ENServicesObjectObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));
                 edtWarrantFIO.Text := GetReturnValue(sgENWarrant,2);
                 edtWarrantPosition.Text := GetReturnValue(sgENWarrant,3);


                  //edtWarrantName.Text := GetReturnValue(sgENWarrant,2);
                  //edtPower.Text := GetReturnValue(sgENWarrant,7);
                  //edtMaxSum.Text := GetReturnValue(sgENWarrant,8);

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;



end;

procedure TfrmENSettingForDFDecreeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     // edtDfDocTypeCode
      //,
      edtDfDocTypeName
     // ,edtCatalogCode
      ,edtCatalogName
      //,edtDfDocPrefixCode
      ,edtDfDocPrefixName
      ,edtPrefixSignerTabN
      ,edtPrefixSignerFio
      ,edtPrefixSignerPostInfo
      ,edtInitiatorTabn
      ,edtInitiatorFio
      ,edtInitiatorPodrName
      //,edtInitiatorPodrCode
      ,edtDesignatedTabn
      ,edtDesignatedFio
      ,edtDesignatedpostInfo
      ,edtENDepartmentName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSettingForDFDecree := HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;


//     if ( edtDfDocTypeCode.Text <> '' ) then
//       ENSettingForDFDecreeObj.dfDocTypeCode := StrToInt(edtDfDocTypeCode.Text)
//     else
//       ENSettingForDFDecreeObj.dfDocTypeCode := Low(Integer) ;

     ENSettingForDFDecreeObj.dfDocTypeName := edtDfDocTypeName.Text;

//     if ( edtCatalogCode.Text <> '' ) then
//       ENSettingForDFDecreeObj.catalogCode := StrToInt(edtCatalogCode.Text)
//     else
//       ENSettingForDFDecreeObj.catalogCode := Low(Integer) ;

     ENSettingForDFDecreeObj.catalogName := edtCatalogName.Text; 

//     if ( edtDfDocPrefixCode.Text <> '' ) then
//       ENSettingForDFDecreeObj.dfDocPrefixCode := StrToInt(edtDfDocPrefixCode.Text)
//     else
//       ENSettingForDFDecreeObj.dfDocPrefixCode := Low(Integer) ;

     ENSettingForDFDecreeObj.dfDocPrefixName := edtDfDocPrefixName.Text; 

     ENSettingForDFDecreeObj.prefixSignerTabN := edtPrefixSignerTabN.Text;

     ENSettingForDFDecreeObj.prefixSignerFio := edtPrefixSignerFio.Text;

     ENSettingForDFDecreeObj.prefixSignerPostInfo := edtPrefixSignerPostInfo.Text;

     ENSettingForDFDecreeObj.initiatorTabn := edtInitiatorTabn.Text; 

     ENSettingForDFDecreeObj.initiatorFio := edtInitiatorFio.Text; 

     ENSettingForDFDecreeObj.initiatorPodrName := edtInitiatorPodrName.Text; 

//     if ( edtInitiatorPodrCode.Text <> '' ) then
//       ENSettingForDFDecreeObj.initiatorPodrCode := StrToInt(edtInitiatorPodrCode.Text)
//     else
//       ENSettingForDFDecreeObj.initiatorPodrCode := Low(Integer) ;

     ENSettingForDFDecreeObj.designatedTabn := edtDesignatedTabn.Text; 

     ENSettingForDFDecreeObj.designatedFio := edtDesignatedFio.Text; 

     ENSettingForDFDecreeObj.designatedpostInfo := edtDesignatedpostInfo.Text; 

    if DialogState = dsInsert then
    begin
      ENSettingForDFDecreeObj.code:=low(Integer);
      TempENSettingForDFDecree.add(ENSettingForDFDecreeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSettingForDFDecree.save(ENSettingForDFDecreeObj);
    end;
  end;
end;


end.