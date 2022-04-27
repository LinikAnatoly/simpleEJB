
unit EditRQInvoiceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, RQInvoiceController ;

type
  TfrmRQInvoiceFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;
    lblNumberProject : TLabel;
    edtNumberProject: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblRQOrgOrgName : TLabel;
  edtRQOrgOrgName : TEdit;
  spbRQOrgOrg : TSpeedButton;
  

  HTTPRIORQInvoice: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQOrgOrgClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQInvoiceFilterEdit: TfrmRQInvoiceFilterEdit;
  RQInvoiceFilterObj: RQInvoiceFilter;

implementation

uses
  ShowRQOrg
  ,RQOrgController, ENConsts
;

{uses  
    EnergyproController, EnergyproController2, RQInvoiceController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtDateGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberDoc.Text := RQInvoiceObj.numberDoc; 



    edtNumberProject.Text := RQInvoiceObj.numberProject; 



      if RQInvoiceObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQInvoiceObj.dateGen.Year,RQInvoiceObj.dateGen.Month,RQInvoiceObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtCommentGen.Text := RQInvoiceObj.commentGen; 



    edtUserGen.Text := RQInvoiceObj.userGen; 



      if RQInvoiceObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQInvoiceObj.dateEdit.Year,RQInvoiceObj.dateEdit.Month,RQInvoiceObj.dateEdit.Day);
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



procedure TfrmRQInvoiceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoice: RQInvoiceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQInvoiceFilterObj.numberDoc := edtNumberDoc.Text; 



     RQInvoiceFilterObj.numberProject := edtNumberProject.Text; 



     if edtdateGen.checked then
     begin 
       if RQInvoiceFilterObj.dateGen = nil then
          RQInvoiceFilterObj.dateGen := TXSDate.Create;
       RQInvoiceFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQInvoiceFilterObj.dateGen := nil;




     RQInvoiceFilterObj.commentGen := edtCommentGen.Text; 



     RQInvoiceFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQInvoiceFilterObj.dateEdit = nil then
          RQInvoiceFilterObj.dateEdit := TXSDate.Create;
       RQInvoiceFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQInvoiceFilterObj.dateEdit := nil;





  end;
end;

procedure TfrmRQInvoiceFilterEdit.spbRQOrgOrgClick(Sender : TObject);
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
               if RQInvoiceFilterObj.org = nil then RQInvoiceFilterObj.org := RQOrg.Create();
               RQInvoiceFilterObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
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