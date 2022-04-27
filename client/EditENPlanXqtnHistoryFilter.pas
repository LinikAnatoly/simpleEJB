
unit EditENPlanXqtnHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanXqtnHistoryController ;

type
  TfrmENPlanXqtnHistoryFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblExecutionPercent : TLabel;
    edtExecutionPercent: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENPlanXqtnHistory: THTTPRIO;

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
  frmENPlanXqtnHistoryFilterEdit: TfrmENPlanXqtnHistoryFilterEdit;
  ENPlanXqtnHistoryFilterObj: ENPlanXqtnHistoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanXqtnHistoryController  ;
}
{$R *.dfm}



procedure TfrmENPlanXqtnHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
      ,edtExecutionPercent
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENPlanXqtnHistoryObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanXqtnHistoryObj.dateGen.Year,ENPlanXqtnHistoryObj.dateGen.Month,ENPlanXqtnHistoryObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENPlanXqtnHistoryObj.executionPercent <> Low(Integer) ) then
       edtExecutionPercent.Text := IntToStr(ENPlanXqtnHistoryObj.executionPercent)
    else
       edtExecutionPercent.Text := '';



    edtUserGen.Text := ENPlanXqtnHistoryObj.userGen; 



      if ENPlanXqtnHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanXqtnHistoryObj.dateEdit.Year,ENPlanXqtnHistoryObj.dateEdit.Month,ENPlanXqtnHistoryObj.dateEdit.Day);
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



procedure TfrmENPlanXqtnHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanXqtnHistory: ENPlanXqtnHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if ENPlanXqtnHistoryFilterObj.dateGen = nil then
          ENPlanXqtnHistoryFilterObj.dateGen := TXSDate.Create;
       ENPlanXqtnHistoryFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENPlanXqtnHistoryFilterObj.dateGen := nil;



     if ( edtExecutionPercent.Text <> '' ) then
       ENPlanXqtnHistoryFilterObj.executionPercent := StrToInt(edtExecutionPercent.Text)
     else
       ENPlanXqtnHistoryFilterObj.executionPercent := Low(Integer) ;
	   



     ENPlanXqtnHistoryFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENPlanXqtnHistoryFilterObj.dateEdit = nil then
          ENPlanXqtnHistoryFilterObj.dateEdit := TXSDate.Create;
       ENPlanXqtnHistoryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPlanXqtnHistoryFilterObj.dateEdit := nil;




  end;
end;




end.