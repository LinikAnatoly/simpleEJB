
unit EditENFuseChangeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuseChangeController ;

type
  TfrmENFuseChangeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblInstallDate : TLabel;
    edtInstallDate: TDateTimePicker;
    lblUninstallDate : TLabel;
    edtUninstallDate: TDateTimePicker;
    lblWorkOrderNumber : TLabel;
    edtWorkOrderNumber: TEdit;

    lblDateWorkOrder : TLabel;
    edtDateWorkOrder: TDateTimePicker;
    lblActNumberGen : TLabel;
    edtActNumberGen: TEdit;

    lblActDateGen : TLabel;
    edtActDateGen: TDateTimePicker;
    lblWorkerEquipChange : TLabel;
    edtWorkerEquipChange: TEdit;


  lblEquipChangeWorkerWorkerName : TLabel;
  edtEquipChangeWorkerWorkerName : TEdit;
  spbEquipChangeWorkerWorker : TSpeedButton;
  

  HTTPRIOENFuseChange: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEquipChangeWorkerWorkerClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFuseChangeFilterEdit: TfrmENFuseChangeFilterEdit;
  ENFuseChangeFilterObj: ENFuseChangeFilter;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENFuseChangeController  ;
}
{$R *.dfm}



procedure TfrmENFuseChangeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtActNumberGen
      ,edtActDateGen
      ,edtWorkerEquipChange
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENFuseChangeObj.name; 



      if ENFuseChangeObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENFuseChangeObj.installDate.Year,ENFuseChangeObj.installDate.Month,ENFuseChangeObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;



      if ENFuseChangeObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENFuseChangeObj.uninstallDate.Year,ENFuseChangeObj.uninstallDate.Month,ENFuseChangeObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;



    edtWorkOrderNumber.Text := ENFuseChangeObj.workOrderNumber; 



      if ENFuseChangeObj.dateWorkOrder <> nil then
      begin
        edtDateWorkOrder.DateTime:=EncodeDate(ENFuseChangeObj.dateWorkOrder.Year,ENFuseChangeObj.dateWorkOrder.Month,ENFuseChangeObj.dateWorkOrder.Day);
        edtDateWorkOrder.checked := true;
      end
      else
      begin
        edtDateWorkOrder.DateTime:=SysUtils.Date;
        edtDateWorkOrder.checked := false;
      end;



    edtActNumberGen.Text := ENFuseChangeObj.actNumberGen; 



      if ENFuseChangeObj.actDateGen <> nil then
      begin
        edtActDateGen.DateTime:=EncodeDate(ENFuseChangeObj.actDateGen.Year,ENFuseChangeObj.actDateGen.Month,ENFuseChangeObj.actDateGen.Day);
        edtActDateGen.checked := true;
      end
      else
      begin
        edtActDateGen.DateTime:=SysUtils.Date;
        edtActDateGen.checked := false;
      end;



    edtWorkerEquipChange.Text := ENFuseChangeObj.workerEquipChange; 


  end;

}

end;



procedure TfrmENFuseChangeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuseChange: ENFuseChangeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFuseChangeFilterObj.name := edtName.Text; 



     if edtinstallDate.checked then
     begin 
       if ENFuseChangeFilterObj.installDate = nil then
          ENFuseChangeFilterObj.installDate := TXSDate.Create;
       ENFuseChangeFilterObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENFuseChangeFilterObj.installDate := nil;



     if edtuninstallDate.checked then
     begin 
       if ENFuseChangeFilterObj.uninstallDate = nil then
          ENFuseChangeFilterObj.uninstallDate := TXSDate.Create;
       ENFuseChangeFilterObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENFuseChangeFilterObj.uninstallDate := nil;



     ENFuseChangeFilterObj.workOrderNumber := edtWorkOrderNumber.Text; 



     if edtdateWorkOrder.checked then
     begin 
       if ENFuseChangeFilterObj.dateWorkOrder = nil then
          ENFuseChangeFilterObj.dateWorkOrder := TXSDate.Create;
       ENFuseChangeFilterObj.dateWorkOrder.XSToNative(GetXSDate(edtdateWorkOrder.DateTime));
     end
     else
       ENFuseChangeFilterObj.dateWorkOrder := nil;



     ENFuseChangeFilterObj.actNumberGen := edtActNumberGen.Text; 



     if edtactDateGen.checked then
     begin 
       if ENFuseChangeFilterObj.actDateGen = nil then
          ENFuseChangeFilterObj.actDateGen := TXSDate.Create;
       ENFuseChangeFilterObj.actDateGen.XSToNative(GetXSDate(edtactDateGen.DateTime));
     end
     else
       ENFuseChangeFilterObj.actDateGen := nil;



     ENFuseChangeFilterObj.workerEquipChange := edtWorkerEquipChange.Text; 




  end;
end;

procedure TfrmENFuseChangeFilterEdit.spbEquipChangeWorkerWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuseChangeFilterObj.worker = nil then ENFuseChangeFilterObj.worker := EquipChangeWorker.Create();
               ENFuseChangeFilterObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
               edtEquipChangeWorkerWorkerName.Text:=GetReturnValue(sgEquipChangeWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEquipChangeWorkerShow.Free;
   end;
end;





end.