
unit EditENDepartmentFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDepartmentController ;

type
  TfrmENDepartmentFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblShortName : TLabel;
    edtShortName: TEdit;
    lblIsVirtual : TLabel;
    edtIsVirtual: TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


  HTTPRIOENDepartment: THTTPRIO;

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
  frmENDepartmentFilterEdit: TfrmENDepartmentFilterEdit;
  ENDepartmentFilterObj: ENDepartmentFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDepartmentController  ;
}
{$R *.dfm}



procedure TfrmENDepartmentFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
      ,edtIsVirtual
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENDepartmentObj.name; 



    edtShortName.Text := ENDepartmentObj.shortName; 



    if ( ENDepartmentObj.isVirtual <> Low(Integer) ) then
       edtIsVirtual.Text := IntToStr(ENDepartmentObj.isVirtual)
    else
       edtIsVirtual.Text := '';



      if ENDepartmentObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENDepartmentObj.dateStart.Year,ENDepartmentObj.dateStart.Month,ENDepartmentObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;



      if ENDepartmentObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENDepartmentObj.dateFinal.Year,ENDepartmentObj.dateFinal.Month,ENDepartmentObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;


  end;

}

end;



procedure TfrmENDepartmentFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDepartment: ENDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDepartmentFilterObj.name := edtName.Text; 



     ENDepartmentFilterObj.shortName := edtShortName.Text; 



     if ( edtIsVirtual.Text <> '' ) then
       ENDepartmentFilterObj.isVirtual := StrToInt(edtIsVirtual.Text)
     else
       ENDepartmentFilterObj.isVirtual := Low(Integer) ;




     if ENDepartmentFilterObj.dateStart = nil then
        ENDepartmentFilterObj.dateStart := TXSDate.Create;
      ENDepartmentFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));




     if ENDepartmentFilterObj.dateFinal = nil then
        ENDepartmentFilterObj.dateFinal := TXSDate.Create;
      ENDepartmentFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));





  end;
end;




end.