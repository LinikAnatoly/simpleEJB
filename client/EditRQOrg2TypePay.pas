
unit EditRQOrg2TypePay;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrg2TypePayController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmRQOrg2TypePayEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIORQOrg2TypePay: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    grpTypePay: TGroupBox;
    spbTypePay: TSpeedButton;
    lblPaymentValue: TLabel;
    spbValue: TSpeedButton;
    edtTypePayName: TEdit;
    edtPaymentValue: TEdit;
    GroupBox1: TGroupBox;
    lblId: TLabel;
    edtId: TEdit;
    lblCodeorg: TLabel;
    edtCodeorg: TEdit;
    lblName: TLabel;
    lblOkpo: TLabel;
    edtOkpo: TEdit;
    edtName: TEdit;
    spbRQOrg: TSpeedButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actViewRQContract2TypePay: TAction;
    actInsertRQContract2TypePay: TAction;
    actEditRQContract2TypePay: TAction;
    actDeleteRQContract2TypePay: TAction;
    actUpdateRQContract2TypePay: TAction;
    HTTPRIORQOrderItemTypePay: THTTPRIO;
    HTTPRIORQContract2TypePay: THTTPRIO;
    lblEmail: TLabel;
    edtEmail: TEdit;
    pcMain: TPageControl;
    tsRQContract2TypePay: TTabSheet;
    tsEmails: TTabSheet;
    tbRQContract2TypePay: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    sgRQContract2TypePay: TAdvStringGrid;
    tbEmails: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem8: TTBItem;
    actViewEmail: TAction;
    actInsertEmail: TAction;
    actEditEmail: TAction;
    actDeleteEmail: TAction;
    actUpdateEmails: TAction;
    sgRQOrgEmails: TAdvStringGrid;
    HTTPRIORQOrgEmails: THTTPRIO;
    pmRQContract2TypePay: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    pmRQOrgEmails: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbRQOrgClick(Sender: TObject);
    procedure spbTypePayClick(Sender: TObject);
    procedure spbValueClick(Sender: TObject);
    procedure actViewRQContract2TypePayExecute(Sender: TObject);
    procedure actEditRQContract2TypePayExecute(Sender: TObject);
    procedure actInsertRQContract2TypePayExecute(Sender: TObject);
    procedure actUpdateRQContract2TypePayExecute(Sender: TObject);
    procedure actDeleteRQContract2TypePayExecute(Sender: TObject);
    procedure actUpdateEmailsExecute(Sender: TObject);
    procedure actInsertEmailExecute(Sender: TObject);
    procedure actViewEmailExecute(Sender: TObject);
    procedure actEditEmailExecute(Sender: TObject);
    procedure actDeleteEmailExecute(Sender: TObject);


  private
    { Private declarations }
    procedure UpdateRQContract2TypePayList;
    procedure UpdateEmailsList;
  public
    { Public declarations }

end;

var
  frmRQOrg2TypePayEdit: TfrmRQOrg2TypePayEdit;
  RQOrg2TypePayObj: RQOrg2TypePay;

implementation

uses ShowRQOrg, ShowRQOrderItemTypePay, ShowRQTypePayValue,
  RQOrgController, RQOrderItemTypePayController, RQTypePayValueController,
  ENConsts, RQContract2TypePayController, EditRQContract2TypePay,
  RQOrgEmailsController, EditRQOrgEmails;


{uses  
    EnergyproController, EnergyproController2, RQOrg2TypePayController  ;
}
{$R *.dfm}

var
  RQContract2TypePayHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Код договору у ФК'
          ,'ID договору у ФК'
          ,'ID партнера з ФК'
          ,'Вид сплати'
          ,'Значення для виду сплати (% / дні)'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  RQOrgEmailsHeaders: array [1..3] of String =
        ( 'Код'
          ,'E-mail постачальника'
          ,'Примітка'
        );

procedure TfrmRQOrg2TypePayEdit.FormShow(Sender: TObject);
var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
    orderItemTypePayObj: RQOrderItemTypePay;
begin
  SetGridHeaders(RQContract2TypePayHeaders, sgRQContract2TypePay.ColumnHeaders);
  SetGridHeaders(RQOrgEmailsHeaders, sgRQOrgEmails.ColumnHeaders);

  DisableControls([edtCode,
                   edtId, edtCodeorg, edtName, edtOkpo,
                   edtTypePayName, edtPaymentValue]);

  pcMain.ActivePage := tsRQContract2TypePay;

  if DialogState = dsView then
  begin
    DisableControls([spbRQOrg, spbTypePay, spbValue]);
    DisableActions([actInsertRQContract2TypePay, actEditRQContract2TypePay, actDeleteRQContract2TypePay,
                    actInsertEmail, actEditEmail, actDeleteEmail]);
  end;

  if DialogState = dsEdit then
    DisableControls([spbRQOrg]);

  if DialogState = dsInsert then
    //HideControls([gbRQContract2TypePay]);
    HideControls([pcMain]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtOkpo
      ,edtId
      ,edtCodeorg
      ,edtTypePayName
      ,edtPaymentValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQOrg2TypePayObj.code);
    if ( RQOrg2TypePayObj.id <> Low(Integer) ) then
       edtId.Text := IntToStr(RQOrg2TypePayObj.id)
    else
       edtId.Text := '';
    edtCodeorg.Text := RQOrg2TypePayObj.codeorg;
    edtName.Text := RQOrg2TypePayObj.name;
    edtOkpo.Text := RQOrg2TypePayObj.okpo;

    edtEmail.Text := RQOrg2TypePayObj.email;

    if ( RQOrg2TypePayObj.paymentValue <> Low(Integer) ) then
       edtPaymentValue.Text := IntToStr(RQOrg2TypePayObj.paymentValue)
    else
       edtPaymentValue.Text := '';

    edtCommentGen.Text := RQOrg2TypePayObj.commentGen;

    if RQOrg2TypePayObj.typePayRef <> nil then
      if RQOrg2TypePayObj.typePayRef.code <> LOW_INT then
      begin
        TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;
        orderItemTypePayObj := TempRQOrderItemTypePay.getObject(RQOrg2TypePayObj.typePayRef.code);
        if orderItemTypePayObj <> nil then
          edtTypePayName.Text := orderItemTypePayObj.name;
      end;

    UpdateRQContract2TypePayList();
    UpdateEmailsList();
  end;
end;



procedure TfrmRQOrg2TypePayEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtOkpo
      ,edtId
      ,edtCodeorg
      ,edtTypePayName
      ,edtPaymentValue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQOrg2TypePay := HTTPRIORQOrg2TypePay as RQOrg2TypePayControllerSoapPort;


     if ( edtId.Text <> '' ) then
       RQOrg2TypePayObj.id := StrToInt(edtId.Text)
     else
       RQOrg2TypePayObj.id := Low(Integer) ;

     RQOrg2TypePayObj.codeorg := edtCodeorg.Text; 

     RQOrg2TypePayObj.name := edtName.Text; 

     RQOrg2TypePayObj.okpo := edtOkpo.Text; 

     RQOrg2TypePayObj.email := edtEmail.Text;

     if ( edtPaymentValue.Text <> '' ) then
       RQOrg2TypePayObj.paymentValue := StrToInt(edtPaymentValue.Text)
     else
       RQOrg2TypePayObj.paymentValue := Low(Integer) ;

     RQOrg2TypePayObj.commentGen := edtCommentGen.Text;



    if DialogState = dsInsert then
    begin
      RQOrg2TypePayObj.code:=low(Integer);
      TempRQOrg2TypePay.add(RQOrg2TypePayObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrg2TypePay.save(RQOrg2TypePayObj);
    end;
  end;
end;


procedure TfrmRQOrg2TypePayEdit.spbRQOrgClick(Sender: TObject);
var 
  frmRQOrgShow: TfrmRQOrgShow;
  //org: RQOrg;
  TempRQOrg: RQOrgControllerSoapPort;
begin
  frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
  frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
  try
    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        edtId.Text := GetReturnValue(sgRQOrg,0);
        edtCodeorg.Text := GetReturnValue(sgRQOrg,8);
        edtName.Text := GetReturnValue(sgRQOrg,1);
        edtOkpo.Text := GetReturnValue(sgRQOrg,2);
      end;
  finally
    frmRQOrgShow.Free;
  end;
end;

procedure TfrmRQOrg2TypePayEdit.spbTypePayClick(Sender: TObject);
var
	 frmRQOrderItemTypePayShow :  TfrmRQOrderItemTypePayShow;
begin
	 frmRQOrderItemTypePayShow:=TfrmRQOrderItemTypePayShow.Create(Application, fmNormal);
	 try
			with frmRQOrderItemTypePayShow do
				if ShowModal = mrOk then
				begin
						try
							 if RQOrg2TypePayObj.typePayRef = nil then RQOrg2TypePayObj.typePayRef := RQOrderItemTypePayRef.Create();
							 RQOrg2TypePayObj.typePayRef.code := StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
							 edtTypePayName.Text:=GetReturnValue(sgRQOrderItemTypePay,1);
							 edtPaymentValue.Text := '';
            except
               on EConvertError do Exit;
						end;
        end;
   finally
			frmRQOrderItemTypePayShow.Free;
   end;
end;

procedure TfrmRQOrg2TypePayEdit.spbValueClick(Sender: TObject);
var
	 frmRQTypePayValueShow :  TfrmRQTypePayValueShow;
	 RQTypePayValueFilterObj : RQTypePayValueFilter;
   isTypePaySet: Boolean;
begin
  isTypePaySet := false;

  RQTypePayValueFilterObj := RQTypePayValueFilter.Create;
  SetNullIntProps(RQTypePayValueFilterObj);
  SetNullXSProps(RQTypePayValueFilterObj);

  if RQOrg2TypePayObj.typePayRef <> nil then
    if RQOrg2TypePayObj.typePayRef.code > LOW_INT then
    begin
      RQTypePayValueFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
      RQTypePayValueFilterObj.typePayRef.code := RQOrg2TypePayObj.typePayRef.code;
      isTypePaySet := true;
    end;

   if not isTypePaySet then
   begin
     Application.MessageBox(PChar('Спочатку оберіть Вид сплати!'),
                         PChar('Увага!'), MB_ICONWARNING);
     edtTypePayName.SetFocus;
     Exit;
   end;

	 frmRQTypePayValueShow:= TfrmRQTypePayValueShow.Create(Application, fmNormal, RQTypePayValueFilterObj);
	 try
			with frmRQTypePayValueShow do
				if ShowModal = mrOk then
				begin
            try
							 RQOrg2TypePayObj.paymentValue := StrToInt(GetReturnValue(sgRQTypePayValue,0));
							 edtPaymentValue.Text:=GetReturnValue(sgRQTypePayValue,1);
						except
							 on EConvertError do Exit;
						end;
        end;
   finally
			frmRQTypePayValueShow.Free;
   end;
end;

procedure TfrmRQOrg2TypePayEdit.UpdateEmailsList;
var
  TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
  i: Integer;
  RQOrgEmailsList: RQOrgEmailsShortList;
  emailsFilter: RQOrgEmailsFilter;
begin
  ClearGrid(sgRQOrgEmails);

  if RQOrg2TypePayObj = nil then
    raise Exception.Create('Не визначено постачальника!');

  if RQOrg2TypePayObj.code = LOW_INT then
    raise Exception.Create('Не визначено постачальника!');

  TempRQOrgEmails :=  HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;

  emailsFilter := RQOrgEmailsFilter.Create;
  SetNullIntProps(emailsFilter);
  SetNullXSProps(emailsFilter);

  emailsFilter.orgRef := RQOrg2TypePayRef.Create;
  emailsFilter.orgRef.code := RQOrg2TypePayObj.code;

  RQOrgEmailsList := TempRQOrgEmails.getScrollableFilteredList(emailsFilter, 0, -1);

  if High(RQOrgEmailsList.list) > -1 then
     sgRQOrgEmails.RowCount := High(RQOrgEmailsList.list)+2
  else
     sgRQOrgEmails.RowCount:=2;

  with sgRQOrgEmails do
    for i := 0 to High(RQOrgEmailsList.list) do
    begin
      Application.ProcessMessages;
      if RQOrgEmailsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrgEmailsList.list[i].code)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := RQOrgEmailsList.list[i].email;
      Cells[2,i+1] := RQOrgEmailsList.list[i].commentGen;

      sgRQOrgEmails.RowCount := i + 2;
    end;

  sgRQOrgEmails.Row := 1;
end;

procedure TfrmRQOrg2TypePayEdit.UpdateRQContract2TypePayList;
var
  TempRQContract2TypePay: RQContract2TypePayControllerSoapPort;
  i: Integer;
  RQContract2TypePayList: RQContract2TypePayShortList;
  contract2typePayFilter: RQContract2TypePayFilter;
begin
  ClearGrid(sgRQContract2TypePay);

  if RQOrg2TypePayObj = nil then
    raise Exception.Create('Не визначено постачальника!');

  if RQOrg2TypePayObj.code = LOW_INT then
    raise Exception.Create('Не визначено постачальника!');

  TempRQContract2TypePay := HTTPRIORQContract2TypePay as RQContract2TypePayControllerSoapPort;

  contract2typePayFilter := RQContract2TypePayFilter.Create;
  SetNullIntProps(contract2typePayFilter);
  SetNullXSProps(contract2typePayFilter);

  contract2typePayFilter.org2TypePayRef := RQOrg2TypePayRef.Create;
  contract2typePayFilter.org2TypePayRef.code := RQOrg2TypePayObj.code;

  RQContract2TypePayList := TempRQContract2TypePay.getScrollableFilteredList(contract2typePayFilter, 0, -1);

  if High(RQContract2TypePayList.list) > -1 then
    sgRQContract2TypePay.RowCount := High(RQContract2TypePayList.list) + 2
  else
    sgRQContract2TypePay.RowCount := 2;

   with sgRQContract2TypePay do
    for i := 0 to High(RQContract2TypePayList.list) do
      begin
        Application.ProcessMessages;
        if RQContract2TypePayList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQContract2TypePayList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQContract2TypePayList.list[i].contractNumber;
        if RQContract2TypePayList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQContract2TypePayList.list[i].contractDate);
        Cells[3,i+1] := RQContract2TypePayList.list[i].finDocCode;
        if RQContract2TypePayList.list[i].finDocID = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(RQContract2TypePayList.list[i].finDocID);
        if RQContract2TypePayList.list[i].partnerID = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(RQContract2TypePayList.list[i].partnerID);

        Cells[6,i+1] := RQContract2TypePayList.list[i].typePayRefName;

        if RQContract2TypePayList.list[i].paymentValue = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(RQContract2TypePayList.list[i].paymentValue);
        Cells[8,i+1] := RQContract2TypePayList.list[i].userGen;
        if RQContract2TypePayList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(RQContract2TypePayList.list[i].dateEdit);
        sgRQContract2TypePay.RowCount := i+2;
      end;

   sgRQContract2TypePay.Row := 1;
end;

procedure TfrmRQOrg2TypePayEdit.actViewEmailExecute(Sender: TObject);
var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
begin
  TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;
  try
    RQOrgEmailsObj := TempRQOrgEmails.getObject(StrToInt(sgRQOrgEmails.Cells[0, sgRQOrgEmails.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQOrgEmailsEdit := TfrmRQOrgEmailsEdit.Create(Application, dsView);
  try
    frmRQOrgEmailsEdit.ShowModal;
  finally
    frmRQOrgEmailsEdit.Free;
  end;
end;

procedure TfrmRQOrg2TypePayEdit.actViewRQContract2TypePayExecute(Sender: TObject);
var TempRQContract2TypePay: RQContract2TypePayControllerSoapPort;
    tmpOrgID: Integer;
begin
  tmpOrgID := LOW_INT;
  try
    if edtId.Text <> '' then
      tmpOrgID := StrToInt(edtId.Text);
  except
    on EConvertError do
      tmpOrgID := LOW_INT;
  end;

  if tmpOrgID = LOW_INT then
    raise Exception.Create('Не визначено постачальника!');

  TempRQContract2TypePay := HTTPRIORQContract2TypePay as RQContract2TypePayControllerSoapPort;
  try
    RQContract2TypePayObj := TempRQContract2TypePay.getObject(StrToInt(sgRQContract2TypePay.Cells[0, sgRQContract2TypePay.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQContract2TypePayEdit := TfrmRQContract2TypePayEdit.Create(Application, dsView);
  try
    frmRQContract2TypePayEdit.orgID := tmpOrgID;
    frmRQContract2TypePayEdit.ShowModal;
  finally
    frmRQContract2TypePayEdit.Free;
  end;
end;

procedure TfrmRQOrg2TypePayEdit.actEditEmailExecute(Sender: TObject);
var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
begin
  TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;
  try
    RQOrgEmailsObj := TempRQOrgEmails.getObject(StrToInt(sgRQOrgEmails.Cells[0, sgRQOrgEmails.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQOrgEmailsEdit := TfrmRQOrgEmailsEdit.Create(Application, dsEdit);
  try
    if frmRQOrgEmailsEdit.ShowModal = mrOk then
      actUpdateEmailsExecute(Sender);
  finally
    frmRQOrgEmailsEdit.Free;
  end;
end;

procedure TfrmRQOrg2TypePayEdit.actEditRQContract2TypePayExecute(Sender: TObject);
var TempRQContract2TypePay: RQContract2TypePayControllerSoapPort;
    tmpOrgID: Integer;
begin
  tmpOrgID := LOW_INT;
  try
    if edtId.Text <> '' then
      tmpOrgID := StrToInt(edtId.Text);
  except
    on EConvertError do
      tmpOrgID := LOW_INT;
  end;

  if tmpOrgID = LOW_INT then
    raise Exception.Create('Не визначено постачальника!');

  TempRQContract2TypePay := HTTPRIORQContract2TypePay as RQContract2TypePayControllerSoapPort;
  try
    RQContract2TypePayObj := TempRQContract2TypePay.getObject(StrToInt(sgRQContract2TypePay.Cells[0, sgRQContract2TypePay.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQContract2TypePayEdit := TfrmRQContract2TypePayEdit.Create(Application, dsEdit);
  try
    frmRQContract2TypePayEdit.orgID := tmpOrgID;
    
    if frmRQContract2TypePayEdit.ShowModal = mrOk then
      actUpdateRQContract2TypePayExecute(Sender);
  finally
    frmRQContract2TypePayEdit.Free;
  end;
end;

procedure TfrmRQOrg2TypePayEdit.actInsertEmailExecute(Sender: TObject);
begin
  if RQOrg2TypePayObj = nil then
    raise Exception.Create('Не визначено постачальника!');

  if RQOrg2TypePayObj.code <= 0 then
    raise Exception.Create('Не визначено постачальника!');

  RQOrgEmailsObj := RQOrgEmails.Create;
  try
    RQOrgEmailsObj.orgRef := RQOrg2TypePayRef.Create;
    RQOrgEmailsObj.orgRef.code := RQOrg2TypePayObj.code;

    frmRQOrgEmailsEdit := TfrmRQOrgEmailsEdit.Create(Application, dsInsert);
    try
      if frmRQOrgEmailsEdit.ShowModal = mrOk then
        actUpdateEmailsExecute(Sender);
    finally
      frmRQOrgEmailsEdit.Free;
    end;
  finally
    RQOrgEmailsObj.Free;
  end;
end;

procedure TfrmRQOrg2TypePayEdit.actInsertRQContract2TypePayExecute(Sender: TObject);
var tmpOrgID: Integer;
begin
  tmpOrgID := LOW_INT;
  try
    if edtId.Text <> '' then
      tmpOrgID := StrToInt(edtId.Text);
  except
    on EConvertError do
      tmpOrgID := LOW_INT;
  end;

  if tmpOrgID = LOW_INT then
    raise Exception.Create('Не визначено постачальника!');

  if RQOrg2TypePayObj = nil then
    raise Exception.Create('Не визначено постачальника!');

  if RQOrg2TypePayObj.code <= 0 then
    raise Exception.Create('Не визначено постачальника!');

  RQContract2TypePayObj := RQContract2TypePay.Create;
  try
    RQContract2TypePayObj.org2TypePayRef := RQOrg2TypePayRef.Create;
    RQContract2TypePayObj.org2TypePayRef.code := RQOrg2TypePayObj.code;

    frmRQContract2TypePayEdit := TfrmRQContract2TypePayEdit.Create(Application, dsInsert);
    try
      frmRQContract2TypePayEdit.orgID := tmpOrgID;
      
      if frmRQContract2TypePayEdit.ShowModal = mrOk then
        actUpdateRQContract2TypePayExecute(Sender);
    finally
      frmRQContract2TypePayEdit.Free;
    end;
  finally
    RQContract2TypePayObj.Free;
  end;
end;

procedure TfrmRQOrg2TypePayEdit.actUpdateEmailsExecute(Sender: TObject);
begin
  UpdateEmailsList();
end;

procedure TfrmRQOrg2TypePayEdit.actUpdateRQContract2TypePayExecute(Sender: TObject);
begin
  UpdateRQContract2TypePayList();
end;

procedure TfrmRQOrg2TypePayEdit.actDeleteEmailExecute(Sender: TObject);
Var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
    ObjCode: Integer;
begin
  TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;
  try
    ObjCode := StrToInt(sgRQOrgEmails.Cells[0, sgRQOrgEmails.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempRQOrgEmails.remove(ObjCode);
    actUpdateEmailsExecute(Sender);
  end;
end;

procedure TfrmRQOrg2TypePayEdit.actDeleteRQContract2TypePayExecute(Sender: TObject);
Var TempRQContract2TypePay: RQContract2TypePayControllerSoapPort;
    ObjCode: Integer;
begin
  TempRQContract2TypePay := HTTPRIORQContract2TypePay as RQContract2TypePayControllerSoapPort;
  try
    ObjCode := StrToInt(sgRQContract2TypePay.Cells[0, sgRQContract2TypePay.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempRQContract2TypePay.remove(ObjCode);
    actUpdateRQContract2TypePayExecute(Sender);
  end;
end;

end.
