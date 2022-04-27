
unit EditENAccumulatorsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAccumulatorsController ;

type
  TfrmENAccumulatorsFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblTypeName : TLabel;
    edtTypeName: TEdit;

    lblFactory : TLabel;
    edtFactory: TEdit;

    lblGarageNumber : TLabel;
    edtGarageNumber: TEdit;

    lblYearProduction : TLabel;
    edtYearProduction: TEdit;

    lblSerialNumber : TLabel;
    edtSerialNumber: TEdit;

    lblReceiptDate : TLabel;
    edtReceiptDate: TDateTimePicker;
    lblMileage : TLabel;
    edtMileage: TEdit;

    lblMileageAll : TLabel;
    edtMileageAll: TEdit;

    lblPotencial : TLabel;
    edtPotencial: TEdit;



  HTTPRIOENAccumulators: THTTPRIO;

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
  frmENAccumulatorsFilterEdit: TfrmENAccumulatorsFilterEdit;
  ENAccumulatorsFilterObj: ENAccumulatorsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAccumulatorsController  ;
}
{$R *.dfm}



procedure TfrmENAccumulatorsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTypeName
      ,edtGarageNumber
      ,edtYearProduction
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENAccumulatorsObj.name; 



    edtTypeName.Text := ENAccumulatorsObj.typeName; 



    edtFactory.Text := ENAccumulatorsObj.factory; 



    edtGarageNumber.Text := ENAccumulatorsObj.garageNumber; 



    edtYearProduction.Text := ENAccumulatorsObj.yearProduction; 



    edtSerialNumber.Text := ENAccumulatorsObj.serialNumber; 



      if ENAccumulatorsObj.receiptDate <> nil then
      begin
        edtReceiptDate.DateTime:=EncodeDate(ENAccumulatorsObj.receiptDate.Year,ENAccumulatorsObj.receiptDate.Month,ENAccumulatorsObj.receiptDate.Day);
        edtReceiptDate.checked := true;
      end
      else
      begin
        edtReceiptDate.DateTime:=SysUtils.Date;
        edtReceiptDate.checked := false;
      end;



    if ( ENAccumulatorsObj.mileage <> nil ) then
       edtMileage.Text := ENAccumulatorsObj.mileage.decimalString
    else
       edtMileage.Text := ''; 



    if ( ENAccumulatorsObj.mileageAll <> nil ) then
       edtMileageAll.Text := ENAccumulatorsObj.mileageAll.decimalString
    else
       edtMileageAll.Text := ''; 



    if ( ENAccumulatorsObj.potencial <> nil ) then
       edtPotencial.Text := ENAccumulatorsObj.potencial.decimalString
    else
       edtPotencial.Text := ''; 


  end;

}

end;



procedure TfrmENAccumulatorsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAccumulators: ENAccumulatorsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAccumulatorsFilterObj.name := edtName.Text; 



     ENAccumulatorsFilterObj.typeName := edtTypeName.Text; 



     ENAccumulatorsFilterObj.factory := edtFactory.Text; 



     ENAccumulatorsFilterObj.garageNumber := edtGarageNumber.Text; 



     ENAccumulatorsFilterObj.yearProduction := edtYearProduction.Text; 



     ENAccumulatorsFilterObj.serialNumber := edtSerialNumber.Text; 



     if edtreceiptDate.checked then
     begin 
       if ENAccumulatorsFilterObj.receiptDate = nil then
          ENAccumulatorsFilterObj.receiptDate := TXSDate.Create;
       ENAccumulatorsFilterObj.receiptDate.XSToNative(GetXSDate(edtreceiptDate.DateTime));
     end
     else
       ENAccumulatorsFilterObj.receiptDate := nil;



     if (ENAccumulatorsFilterObj.mileage = nil ) then
       ENAccumulatorsFilterObj.mileage := TXSDecimal.Create;
     if edtMileage.Text <> '' then
       ENAccumulatorsFilterObj.mileage.decimalString := edtMileage.Text 
     else
       ENAccumulatorsFilterObj.mileage := nil;




     if (ENAccumulatorsFilterObj.mileageAll = nil ) then
       ENAccumulatorsFilterObj.mileageAll := TXSDecimal.Create;
     if edtMileageAll.Text <> '' then
       ENAccumulatorsFilterObj.mileageAll.decimalString := edtMileageAll.Text 
     else
       ENAccumulatorsFilterObj.mileageAll := nil;




     if (ENAccumulatorsFilterObj.potencial = nil ) then
       ENAccumulatorsFilterObj.potencial := TXSDecimal.Create;
     if edtPotencial.Text <> '' then
       ENAccumulatorsFilterObj.potencial.decimalString := edtPotencial.Text 
     else
       ENAccumulatorsFilterObj.potencial := nil;





  end;
end;




end.