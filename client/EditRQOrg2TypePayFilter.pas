
unit EditRQOrg2TypePayFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrg2TypePayController ;

type
  TfrmRQOrg2TypePayFilterEdit = class(TDialogForm)


  HTTPRIORQOrg2TypePay: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    GroupBox1: TGroupBox;
    lblId: TLabel;
    lblCodeorg: TLabel;
    lblName: TLabel;
    lblOkpo: TLabel;
    spbRQOrg: TSpeedButton;
    edtId: TEdit;
    edtCodeorg: TEdit;
    edtOkpo: TEdit;
    edtName: TEdit;
    grpTypePay: TGroupBox;
    spbTypePay: TSpeedButton;
    lblPaymentValue: TLabel;
    spbValue: TSpeedButton;
    edtTypePayName: TEdit;
    edtPaymentValue: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbRQOrgClick(Sender: TObject);
    procedure spbTypePayClick(Sender: TObject);
    procedure spbValueClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQOrg2TypePayFilterEdit: TfrmRQOrg2TypePayFilterEdit;
  RQOrg2TypePayFilterObj: RQOrg2TypePayFilter;

implementation

uses RQOrgController, ShowRQOrderItemTypePay, RQOrderItemTypePayController,
  ShowRQTypePayValue, RQTypePayValueController, ShowRQOrg, ENConsts;


{uses  
    EnergyproController, EnergyproController2, RQOrg2TypePayController  ;
}
{$R *.dfm}



procedure TfrmRQOrg2TypePayFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtId, edtCodeorg, edtName, edtOkpo,
                   edtTypePayName, edtPaymentValue]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtId
      ,edtCodeorg
      ,edtName
      ,edtOkpo
      ,edtPaymentValue
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQOrg2TypePayObj.id <> Low(Integer) ) then
       edtId.Text := IntToStr(RQOrg2TypePayObj.id)
    else
       edtId.Text := '';



    edtCodeorg.Text := RQOrg2TypePayObj.codeorg; 



    edtName.Text := RQOrg2TypePayObj.name; 



    edtOkpo.Text := RQOrg2TypePayObj.okpo; 



    if ( RQOrg2TypePayObj.paymentValue <> Low(Integer) ) then
       edtPaymentValue.Text := IntToStr(RQOrg2TypePayObj.paymentValue)
    else
       edtPaymentValue.Text := '';



    edtCommentGen.Text := RQOrg2TypePayObj.commentGen; 



    edtUserGen.Text := RQOrg2TypePayObj.userGen; 



      if RQOrg2TypePayObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQOrg2TypePayObj.dateEdit.Year,RQOrg2TypePayObj.dateEdit.Month,RQOrg2TypePayObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmRQOrg2TypePayFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrg2TypePay: RQOrg2TypePayControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtId.Text <> '' ) then
       RQOrg2TypePayFilterObj.id := StrToInt(edtId.Text)
     else
       RQOrg2TypePayFilterObj.id := Low(Integer) ;

     RQOrg2TypePayFilterObj.codeorg := edtCodeorg.Text;
     //RQOrg2TypePayFilterObj.name := edtName.Text;
     RQOrg2TypePayFilterObj.okpo := edtOkpo.Text;
     if ( edtPaymentValue.Text <> '' ) then
       RQOrg2TypePayFilterObj.paymentValue := StrToInt(edtPaymentValue.Text)
     else
       RQOrg2TypePayFilterObj.paymentValue := Low(Integer) ;

  end;
end;




procedure TfrmRQOrg2TypePayFilterEdit.spbRQOrgClick(Sender: TObject);
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

procedure TfrmRQOrg2TypePayFilterEdit.spbTypePayClick(Sender: TObject);
var
	 frmRQOrderItemTypePayShow :  TfrmRQOrderItemTypePayShow;
begin
	 frmRQOrderItemTypePayShow:=TfrmRQOrderItemTypePayShow.Create(Application, fmNormal);
	 try
			with frmRQOrderItemTypePayShow do
				if ShowModal = mrOk then
				begin
						try
							 if RQOrg2TypePayFilterObj.typePayRef = nil then RQOrg2TypePayFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
							 RQOrg2TypePayFilterObj.typePayRef.code := StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
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

procedure TfrmRQOrg2TypePayFilterEdit.spbValueClick(Sender: TObject);
var
	 frmRQTypePayValueShow :  TfrmRQTypePayValueShow;
	 RQTypePayValueFilterObj : RQTypePayValueFilter;
   isTypePaySet: Boolean;
begin
  isTypePaySet := false;

  RQTypePayValueFilterObj := RQTypePayValueFilter.Create;
  SetNullIntProps(RQTypePayValueFilterObj);
  SetNullXSProps(RQTypePayValueFilterObj);

  if RQOrg2TypePayFilterObj.typePayRef <> nil then
    if RQOrg2TypePayFilterObj.typePayRef.code > LOW_INT then
    begin
      RQTypePayValueFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
      RQTypePayValueFilterObj.typePayRef.code := RQOrg2TypePayFilterObj.typePayRef.code;
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
							 RQOrg2TypePayFilterObj.paymentValue := StrToInt(GetReturnValue(sgRQTypePayValue,0));
							 edtPaymentValue.Text:=GetReturnValue(sgRQTypePayValue,1);
						except
							 on EConvertError do Exit;
						end;
        end;
   finally
			frmRQTypePayValueShow.Free;
   end;
end;

end.