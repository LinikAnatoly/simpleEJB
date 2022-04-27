
unit EditENContractFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts, ENContractController;

type
  TfrmENContractFilterEdit = class(TDialogForm)

    lblContractNumber : TLabel;
    edtContractNumber: TEdit;

    lblContractDate : TLabel;
    edtContractDate: TDateTimePicker;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;

    lblFinDocID : TLabel;
    edtFinDocID: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblRQOrgOrgName : TLabel;
  edtRQOrgOrgName : TEdit;
  spbRQOrgOrg : TSpeedButton;
  

  HTTPRIOENContract: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label1: TLabel;
    edtOrgName: TEdit;
    spbRQOrg: TSpeedButton;
    spbRQOrgClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQOrgOrgClick(Sender : TObject);
    procedure spbRQOrgClick(Sender: TObject);
    procedure spbRQOrgClearClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENContractFilterEdit: TfrmENContractFilterEdit;
  ENContractFilterObj: ENContractFilter;

implementation

uses
  ShowRQOrg
  ,RQOrgController
, DMReportsUnit;

{uses  
    EnergyproController, EnergyproController2, ENContractController  ;
}
{$R *.dfm}



procedure TfrmENContractFilterEdit.FormShow(Sender: TObject);

begin

 DisableControls([edtOrgName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtContractNumber.Text := ENContractObj.contractNumber; 



      if ENContractObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENContractObj.contractDate.Year,ENContractObj.contractDate.Month,ENContractObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtFinDocCode.Text := ENContractObj.finDocCode; 



    if ( ENContractObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENContractObj.finDocID)
    else
       edtFinDocID.Text := '';



    edtCommentGen.Text := ENContractObj.commentGen; 



    edtUserGen.Text := ENContractObj.userGen; 



      if ENContractObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENContractObj.dateEdit.Year,ENContractObj.dateEdit.Month,ENContractObj.dateEdit.Day);
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



procedure TfrmENContractFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContract: ENContractControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENContractFilterObj.contractNumber := edtContractNumber.Text; 



     if edtcontractDate.checked then
     begin 
       if ENContractFilterObj.contractDate = nil then
          ENContractFilterObj.contractDate := TXSDate.Create;
       ENContractFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENContractFilterObj.contractDate := nil;



     ENContractFilterObj.finDocCode := edtFinDocCode.Text; 



     if ( edtFinDocID.Text <> '' ) then
       ENContractFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENContractFilterObj.finDocID := Low(Integer) ;




     ENContractFilterObj.commentGen := edtCommentGen.Text; 



     ENContractFilterObj.userGen := edtUserGen.Text;






     if edtdateEdit.checked then
     begin 
       if ENContractFilterObj.dateEdit = nil then
          ENContractFilterObj.dateEdit := TXSDate.Create;
       ENContractFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENContractFilterObj.dateEdit := nil;




  end;
end;

procedure TfrmENContractFilterEdit.spbRQOrgClearClick(Sender: TObject);
begin
  edtRQOrgOrgName.Text := '';
  ENContractFilterObj.org := nil;

end;

procedure TfrmENContractFilterEdit.spbRQOrgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   TempRQOrg: RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
   tmpOrg: RQOrg;
begin
{
   frmRQOrgShow:=TfrmRQOrgShow.Create(Application, fmNormal);
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try

               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               edtOrgName.Text := GetReturnValue(sgRQOrg,1);
               if ENContractFilterObj.org = nil then ENContractFilterObj.org := RQOrg.Create();
               ENContractFilterObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
}
  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, ENContractFilterObj.org) then
  begin
    ENContractFilterObj.org := tmpOrg;
    edtRQOrgOrgName.Text := ENContractFilterObj.org.name;
    edtOrgName.Text := ENContractFilterObj.org.name;
  end;
end;

procedure TfrmENContractFilterEdit.spbRQOrgOrgClick(Sender : TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContractFilterObj.org = nil then ENContractFilterObj.org := RQOrg.Create();
               ENContractFilterObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
               edtRQOrgOrgName.Text:=GetReturnValue(sgRQOrg,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;





end.