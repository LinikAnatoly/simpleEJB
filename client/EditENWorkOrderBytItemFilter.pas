
unit EditENWorkOrderBytItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderBytItemController ;

type
  TfrmENWorkOrderBytItemFilterEdit = class(TDialogForm)

    lblContractNumberServices : TLabel;
    edtContractNumberServices: TEdit;

    lblAccountNumber : TLabel;
    edtAccountNumber: TEdit;

    lblName : TLabel;
    edtName: TMemo;

    lblAddress : TLabel;
    edtAddress: TMemo;

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;

    lblSerialNumber : TLabel;
    edtSerialNumber: TEdit;

    lblSeal : TLabel;
    edtSeal: TEdit;

    lblPhone : TLabel;
    edtPhone: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblUserEdit : TLabel;
    edtUserEdit: TEdit;


  lblFINWorkerFinWorkerName : TLabel;
  edtFINWorkerFinWorkerName : TEdit;
  spbFINWorkerFinWorker : TSpeedButton;
  

  HTTPRIOENWorkOrderBytItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWorkOrderBytItemFilterEdit: TfrmENWorkOrderBytItemFilterEdit;
  ENWorkOrderBytItemFilterObj: ENWorkOrderBytItemFilter;

implementation

uses
  ShowFINWorker
  ,FINWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytItemController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderBytItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtAddress
      ,edtDateAdd
      ,edtDateEdit
      ,edtUserAdd
      ,edtUserEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtContractNumberServices.Text := ENWorkOrderBytItemObj.contractNumberServices; 



    edtAccountNumber.Text := ENWorkOrderBytItemObj.accountNumber; 



    MakeMultiline(edtName.Lines, ENWorkOrderBytItemObj.name);



    MakeMultiline(edtAddress.Lines, ENWorkOrderBytItemObj.address);



    edtInvNumber.Text := ENWorkOrderBytItemObj.invNumber; 



    edtSerialNumber.Text := ENWorkOrderBytItemObj.serialNumber; 



    edtSeal.Text := ENWorkOrderBytItemObj.seal; 



    edtPhone.Text := ENWorkOrderBytItemObj.phone; 



    MakeMultiline(edtCommentGen.Lines, ENWorkOrderBytItemObj.commentGen);



      if ENWorkOrderBytItemObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENWorkOrderBytItemObj.dateAdd.Year,ENWorkOrderBytItemObj.dateAdd.Month,ENWorkOrderBytItemObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



      if ENWorkOrderBytItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENWorkOrderBytItemObj.dateEdit.Year,ENWorkOrderBytItemObj.dateEdit.Month,ENWorkOrderBytItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserAdd.Text := ENWorkOrderBytItemObj.userAdd; 



    edtUserEdit.Text := ENWorkOrderBytItemObj.userEdit; 


  end;

}

end;



procedure TfrmENWorkOrderBytItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     ENWorkOrderBytItemFilterObj.contractNumberServices := edtContractNumberServices.Text; 



     ENWorkOrderBytItemFilterObj.accountNumber := edtAccountNumber.Text; 



     ENWorkOrderBytItemFilterObj.name := edtName.Text; 



     ENWorkOrderBytItemFilterObj.address := edtAddress.Text; 



     ENWorkOrderBytItemFilterObj.invNumber := edtInvNumber.Text; 



     ENWorkOrderBytItemFilterObj.serialNumber := edtSerialNumber.Text; 



     ENWorkOrderBytItemFilterObj.seal := edtSeal.Text; 



     ENWorkOrderBytItemFilterObj.phone := edtPhone.Text; 



     ENWorkOrderBytItemFilterObj.commentGen := edtCommentGen.Text; 



     if edtdateAdd.checked then
     begin 
       if ENWorkOrderBytItemFilterObj.dateAdd = nil then
          ENWorkOrderBytItemFilterObj.dateAdd := TXSDateTime.Create;
       ENWorkOrderBytItemFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENWorkOrderBytItemFilterObj.dateAdd := nil;



     if edtdateEdit.checked then
     begin 
       if ENWorkOrderBytItemFilterObj.dateEdit = nil then
          ENWorkOrderBytItemFilterObj.dateEdit := TXSDateTime.Create;
       ENWorkOrderBytItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENWorkOrderBytItemFilterObj.dateEdit := nil;



     ENWorkOrderBytItemFilterObj.userAdd := edtUserAdd.Text; 



     ENWorkOrderBytItemFilterObj.userEdit := edtUserEdit.Text; 




  end;
end;

procedure TfrmENWorkOrderBytItemFilterEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
begin
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWorkOrderBytItemFilterObj.finWorker = nil then ENWorkOrderBytItemFilterObj.finWorker := FINWorker.Create();
               ENWorkOrderBytItemFilterObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;





end.