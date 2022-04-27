
unit EditENConnectionTariffEntryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionTariffEntryController ;

type
  TfrmENConnectionTariffEntryFilterEdit = class(TDialogForm)

    lblValue : TLabel;
    edtValue: TEdit;

    lblStartDate : TLabel;
    edtStartDate: TDateTimePicker;


  lblENConnectionTariffTariffRefName : TLabel;
  edtENConnectionTariffTariffRefName : TEdit;
  spbENConnectionTariffTariffRef : TSpeedButton;
  

  HTTPRIOENConnectionTariffEntry: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENConnectionTariffTariffRefClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENConnectionTariffEntryFilterEdit: TfrmENConnectionTariffEntryFilterEdit;
  ENConnectionTariffEntryFilterObj: ENConnectionTariffEntryFilter;

implementation

uses
  ShowENConnectionTariff
  ,ENConnectionTariffController
;

{uses  
    EnergyproController, EnergyproController2, ENConnectionTariffEntryController  ;
}
{$R *.dfm}



procedure TfrmENConnectionTariffEntryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue
      ,edtStartDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENConnectionTariffEntryObj.value <> nil ) then
       edtValue.Text := ENConnectionTariffEntryObj.value.decimalString
    else
       edtValue.Text := ''; 



      if ENConnectionTariffEntryObj.startDate <> nil then
      begin
        edtStartDate.DateTime:=EncodeDate(ENConnectionTariffEntryObj.startDate.Year,ENConnectionTariffEntryObj.startDate.Month,ENConnectionTariffEntryObj.startDate.Day);
        edtStartDate.checked := true;
      end
      else
      begin
        edtStartDate.DateTime:=SysUtils.Date;
        edtStartDate.checked := false;
      end;



    edtUserGen.Text := ENConnectionTariffEntryObj.userGen; 


  end;

}

end;



procedure TfrmENConnectionTariffEntryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENConnectionTariffEntryFilterObj.value = nil ) then
       ENConnectionTariffEntryFilterObj.value := TXSDecimal.Create;
     if edtValue.Text <> '' then
       ENConnectionTariffEntryFilterObj.value.decimalString := edtValue.Text 
     else
       ENConnectionTariffEntryFilterObj.value := nil;




     if edtstartDate.checked then
     begin 
       if ENConnectionTariffEntryFilterObj.startDate = nil then
          ENConnectionTariffEntryFilterObj.startDate := TXSDate.Create;
       ENConnectionTariffEntryFilterObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
     end
     else
       ENConnectionTariffEntryFilterObj.startDate := nil;
  end;
end;

procedure TfrmENConnectionTariffEntryFilterEdit.spbENConnectionTariffTariffRefClick(Sender : TObject);
var 
   frmENConnectionTariffShow: TfrmENConnectionTariffShow;
begin
   frmENConnectionTariffShow:=TfrmENConnectionTariffShow.Create(Application,fmNormal);
   try
      with frmENConnectionTariffShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffEntryFilterObj.tariffRef = nil then ENConnectionTariffEntryFilterObj.tariffRef := ENConnectionTariffRef.Create();
               ENConnectionTariffEntryFilterObj.tariffRef.code := StrToInt(GetReturnValue(sgENConnectionTariff,0));
               edtENConnectionTariffTariffRefName.Text:=GetReturnValue(sgENConnectionTariff,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionTariffShow.Free;
   end;
end;





end.