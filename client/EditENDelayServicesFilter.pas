
unit EditENDelayServicesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDelayServicesController ;

type
  TfrmENDelayServicesFilterEdit = class(TDialogForm)

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblWorkDaysCount : TLabel;
    edtWorkDaysCount: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENDelayServices: THTTPRIO;

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
  frmENDelayServicesFilterEdit: TfrmENDelayServicesFilterEdit;
  ENDelayServicesFilterObj: ENDelayServicesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDelayServicesController  ;
}
{$R *.dfm}



procedure TfrmENDelayServicesFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      ,edtDateFinal
      ,edtWorkDaysCount
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENDelayServicesObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENDelayServicesObj.dateStart.Year,ENDelayServicesObj.dateStart.Month,ENDelayServicesObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;



      if ENDelayServicesObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENDelayServicesObj.dateFinal.Year,ENDelayServicesObj.dateFinal.Month,ENDelayServicesObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;



    if ( ENDelayServicesObj.workDaysCount <> Low(Integer) ) then
       edtWorkDaysCount.Text := IntToStr(ENDelayServicesObj.workDaysCount)
    else
       edtWorkDaysCount.Text := '';



    edtUserGen.Text := ENDelayServicesObj.userGen; 



      if ENDelayServicesObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENDelayServicesObj.dateEdit.Year,ENDelayServicesObj.dateEdit.Month,ENDelayServicesObj.dateEdit.Day);
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



procedure TfrmENDelayServicesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDelayServices: ENDelayServicesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateStart.checked then
     begin 
       if ENDelayServicesFilterObj.dateStart = nil then
          ENDelayServicesFilterObj.dateStart := TXSDate.Create;
       ENDelayServicesFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENDelayServicesFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if ENDelayServicesFilterObj.dateFinal = nil then
          ENDelayServicesFilterObj.dateFinal := TXSDate.Create;
       ENDelayServicesFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENDelayServicesFilterObj.dateFinal := nil;



     if ( edtWorkDaysCount.Text <> '' ) then
       ENDelayServicesFilterObj.workDaysCount := StrToInt(edtWorkDaysCount.Text)
     else
       ENDelayServicesFilterObj.workDaysCount := Low(Integer) ;




     ENDelayServicesFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENDelayServicesFilterObj.dateEdit = nil then
          ENDelayServicesFilterObj.dateEdit := TXSDateTime.Create;
       ENDelayServicesFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENDelayServicesFilterObj.dateEdit := nil;




  end;
end;




end.