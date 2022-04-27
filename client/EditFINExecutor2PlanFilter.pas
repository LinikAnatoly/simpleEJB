
unit EditFINExecutor2PlanFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINExecutor2PlanController ;

type
  TfrmFINExecutor2PlanFilterEdit = class(TDialogForm)

    lblPercentLoad : TLabel;
    edtPercentLoad: TEdit;

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblTotalTimeHours : TLabel;
    edtTotalTimeHours: TEdit;

    lblTotalTimeDays : TLabel;
    edtTotalTimeDays: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOFINExecutor2Plan: THTTPRIO;

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
  frmFINExecutor2PlanFilterEdit: TfrmFINExecutor2PlanFilterEdit;
  FINExecutor2PlanFilterObj: FINExecutor2PlanFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINExecutor2PlanController  ;
}
{$R *.dfm}



procedure TfrmFINExecutor2PlanFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPercentLoad
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( FINExecutor2PlanObj.percentLoad <> nil ) then
       edtPercentLoad.Text := FINExecutor2PlanObj.percentLoad.decimalString
    else
       edtPercentLoad.Text := ''; 



      if FINExecutor2PlanObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(FINExecutor2PlanObj.dateStart.Year,FINExecutor2PlanObj.dateStart.Month,FINExecutor2PlanObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;



      if FINExecutor2PlanObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(FINExecutor2PlanObj.dateFinal.Year,FINExecutor2PlanObj.dateFinal.Month,FINExecutor2PlanObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;



    if ( FINExecutor2PlanObj.totalTimeHours <> nil ) then
       edtTotalTimeHours.Text := FINExecutor2PlanObj.totalTimeHours.decimalString
    else
       edtTotalTimeHours.Text := ''; 



    if ( FINExecutor2PlanObj.totalTimeDays <> nil ) then
       edtTotalTimeDays.Text := FINExecutor2PlanObj.totalTimeDays.decimalString
    else
       edtTotalTimeDays.Text := ''; 



    edtUserGen.Text := FINExecutor2PlanObj.userGen; 



      if FINExecutor2PlanObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(FINExecutor2PlanObj.dateEdit.Year,FINExecutor2PlanObj.dateEdit.Month,FINExecutor2PlanObj.dateEdit.Day);
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



procedure TfrmFINExecutor2PlanFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (FINExecutor2PlanFilterObj.percentLoad = nil ) then
       FINExecutor2PlanFilterObj.percentLoad := TXSDecimal.Create;
     if edtPercentLoad.Text <> '' then
       FINExecutor2PlanFilterObj.percentLoad.decimalString := edtPercentLoad.Text 
     else
       FINExecutor2PlanFilterObj.percentLoad := nil;




     if edtdateStart.checked then
     begin 
       if FINExecutor2PlanFilterObj.dateStart = nil then
          FINExecutor2PlanFilterObj.dateStart := TXSDate.Create;
       FINExecutor2PlanFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       FINExecutor2PlanFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if FINExecutor2PlanFilterObj.dateFinal = nil then
          FINExecutor2PlanFilterObj.dateFinal := TXSDate.Create;
       FINExecutor2PlanFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       FINExecutor2PlanFilterObj.dateFinal := nil;



     if (FINExecutor2PlanFilterObj.totalTimeHours = nil ) then
       FINExecutor2PlanFilterObj.totalTimeHours := TXSDecimal.Create;
     if edtTotalTimeHours.Text <> '' then
       FINExecutor2PlanFilterObj.totalTimeHours.decimalString := edtTotalTimeHours.Text 
     else
       FINExecutor2PlanFilterObj.totalTimeHours := nil;




     if (FINExecutor2PlanFilterObj.totalTimeDays = nil ) then
       FINExecutor2PlanFilterObj.totalTimeDays := TXSDecimal.Create;
     if edtTotalTimeDays.Text <> '' then
       FINExecutor2PlanFilterObj.totalTimeDays.decimalString := edtTotalTimeDays.Text 
     else
       FINExecutor2PlanFilterObj.totalTimeDays := nil;




     FINExecutor2PlanFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if FINExecutor2PlanFilterObj.dateEdit = nil then
          FINExecutor2PlanFilterObj.dateEdit := TXSDateTime.Create;
       FINExecutor2PlanFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       FINExecutor2PlanFilterObj.dateEdit := nil;




  end;
end;




end.