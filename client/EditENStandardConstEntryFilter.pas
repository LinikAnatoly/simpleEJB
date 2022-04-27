
unit EditENStandardConstEntryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENStandardConstEntryController ;

type
  TfrmENStandardConstEntryFilterEdit = class(TDialogForm)

    lblConstEntry : TLabel;
    edtConstEntry: TEdit;

    lblStartDate : TLabel;
    edtStartDate: TDateTimePicker;
    lblEndDate : TLabel;
    edtEndDate: TDateTimePicker;


  HTTPRIOENStandardConstEntry: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENStandardConstEntryFilterEdit: TfrmENStandardConstEntryFilterEdit;
  ENStandardConstEntryFilterObj: ENStandardConstEntryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENStandardConstEntryController  ;
}
{$R *.dfm}



procedure TfrmENStandardConstEntryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtConstEntry
      ,edtStartDate
      ,edtEndDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENStandardConstEntryObj.ConstEntry <> nil ) then
       edtConstEntry.Text := ENStandardConstEntryObj.ConstEntry.decimalString
    else
       edtConstEntry.Text := ''; 



      if ENStandardConstEntryObj.startDate <> nil then
      begin
        edtStartDate.DateTime:=EncodeDate(ENStandardConstEntryObj.startDate.Year,ENStandardConstEntryObj.startDate.Month,ENStandardConstEntryObj.startDate.Day);
        edtStartDate.checked := true;
      end
      else
      begin
        edtStartDate.DateTime:=SysUtils.Date;
        edtStartDate.checked := false;
      end;



      if ENStandardConstEntryObj.endDate <> nil then
      begin
        edtEndDate.DateTime:=EncodeDate(ENStandardConstEntryObj.endDate.Year,ENStandardConstEntryObj.endDate.Month,ENStandardConstEntryObj.endDate.Day);
        edtEndDate.checked := true;
      end
      else
      begin
        edtEndDate.DateTime:=SysUtils.Date;
        edtEndDate.checked := false;
      end;


  end;

}

end;



procedure TfrmENStandardConstEntryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENStandardConstEntry: ENStandardConstEntryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENStandardConstEntryFilterObj.ConstEntry = nil ) then
       ENStandardConstEntryFilterObj.ConstEntry := TXSDecimal.Create;
     if edtConstEntry.Text <> '' then
       ENStandardConstEntryFilterObj.ConstEntry.decimalString := edtConstEntry.Text 
     else
       ENStandardConstEntryFilterObj.ConstEntry := nil;




     if edtstartDate.checked then
     begin 
       if ENStandardConstEntryFilterObj.startDate = nil then
          ENStandardConstEntryFilterObj.startDate := TXSDate.Create;
       ENStandardConstEntryFilterObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
     end
     else
       ENStandardConstEntryFilterObj.startDate := nil;



     if edtendDate.checked then
     begin 
       if ENStandardConstEntryFilterObj.endDate = nil then
          ENStandardConstEntryFilterObj.endDate := TXSDate.Create;
       ENStandardConstEntryFilterObj.endDate.XSToNative(GetXSDate(edtendDate.DateTime));
     end
     else
       ENStandardConstEntryFilterObj.endDate := nil;




  end;
end;




end.