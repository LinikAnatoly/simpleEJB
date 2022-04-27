
unit EditENTechConditionsObjectsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTechConditionsObjectsController ;

type
  TfrmENTechConditionsObjectsFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCustomer : TLabel;
    edtCustomer: TEdit;

    lblBuilding : TLabel;
    edtBuilding: TEdit;

    lblAddress : TLabel;
    edtAddress: TEdit;

    lblTyServicesPower : TLabel;
    edtTyServicesPower: TEdit;
  
  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;

  btnOk: TButton;
  btnCancel: TButton;
    lbl1: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENDepartmentDepartmentClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTechConditionsObjectsFilterEdit: TfrmENTechConditionsObjectsFilterEdit;
  ENTechConditionsObjectsFilterObj: ENTechConditionsObjectsFilter;

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENDepartment
  ,ENDepartmentController
;

{uses  
    EnergyproController, EnergyproController2, ENTechConditionsObjectsController  ;
}
{$R *.dfm}



procedure TfrmENTechConditionsObjectsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtCustomer
      ,edtBuilding
      ,edtAddress
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := ENTechConditionsObjectsObj.numberGen; 



      if ENTechConditionsObjectsObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTechConditionsObjectsObj.dateGen.Year,ENTechConditionsObjectsObj.dateGen.Month,ENTechConditionsObjectsObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtCustomer.Text := ENTechConditionsObjectsObj.customer; 



    edtBuilding.Text := ENTechConditionsObjectsObj.building; 



    edtAddress.Text := ENTechConditionsObjectsObj.address; 



    if ( ENTechConditionsObjectsObj.tyServicesPower <> nil ) then
       edtTyServicesPower.Text := ENTechConditionsObjectsObj.tyServicesPower.decimalString
    else
       edtTyServicesPower.Text := ''; 


  end;

}

end;



procedure TfrmENTechConditionsObjectsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTechConditionsObjectsFilterObj.numberGen := edtNumberGen.Text; 



     if edtdateGen.checked then
     begin 
       if ENTechConditionsObjectsFilterObj.dateGen = nil then
          ENTechConditionsObjectsFilterObj.dateGen := TXSDate.Create;
       ENTechConditionsObjectsFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTechConditionsObjectsFilterObj.dateGen := nil;



     ENTechConditionsObjectsFilterObj.customer := edtCustomer.Text; 



     ENTechConditionsObjectsFilterObj.building := edtBuilding.Text; 



     ENTechConditionsObjectsFilterObj.address := edtAddress.Text; 



     if (ENTechConditionsObjectsFilterObj.tyServicesPower = nil ) then
       ENTechConditionsObjectsFilterObj.tyServicesPower := TXSDecimal.Create;
     if edtTyServicesPower.Text <> '' then
       ENTechConditionsObjectsFilterObj.tyServicesPower.decimalString := edtTyServicesPower.Text 
     else
       ENTechConditionsObjectsFilterObj.tyServicesPower := nil; 

  end;
end;

procedure TfrmENTechConditionsObjectsFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsObjectsFilterObj.element = nil then ENTechConditionsObjectsFilterObj.element := ENElement.Create();
               ENTechConditionsObjectsFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENTechConditionsObjectsFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsObjectsFilterObj.department = nil then ENTechConditionsObjectsFilterObj.department := ENDepartment.Create();
               ENTechConditionsObjectsFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;





end.