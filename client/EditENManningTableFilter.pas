
unit EditENManningTableFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENManningTableController ;

type
  TfrmENManningTableFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblFinCode : TLabel;
    edtFinCode: TEdit;

  lblENPositionPositionName : TLabel;
  edtENPositionPositionName : TEdit;
  spbENPositionPosition : TSpeedButton;
  
  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  

  HTTPRIOENManningTable: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPositionPositionClick(Sender : TObject);
  procedure spbENDepartmentDepartmentClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENManningTableFilterEdit: TfrmENManningTableFilterEdit;
  ENManningTableFilterObj: ENManningTableFilter;

implementation

uses
  ShowENPosition
  ,ENPositionController
  ,ShowENDepartment
  ,ENDepartmentController
;

{uses  
    EnergyproController, EnergyproController2, ENManningTableController  ;
}
{$R *.dfm}



procedure TfrmENManningTableFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtFinCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENManningTableObj.name; 



      if ENManningTableObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENManningTableObj.dateStart.Year,ENManningTableObj.dateStart.Month,ENManningTableObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;



      if ENManningTableObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENManningTableObj.dateFinal.Year,ENManningTableObj.dateFinal.Month,ENManningTableObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;



    if ( ENManningTableObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(ENManningTableObj.finCode)
    else
       edtFinCode.Text := '';


  end;

}

end;



procedure TfrmENManningTableFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENManningTable: ENManningTableControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENManningTableFilterObj.name := edtName.Text; 



     if ENManningTableFilterObj.dateStart = nil then
        ENManningTableFilterObj.dateStart := TXSDate.Create;
      ENManningTableFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));




     if ENManningTableFilterObj.dateFinal = nil then
        ENManningTableFilterObj.dateFinal := TXSDate.Create;
      ENManningTableFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));




     if ( edtFinCode.Text <> '' ) then
       ENManningTableFilterObj.finCode := StrToInt(edtFinCode.Text)
     else
       ENManningTableFilterObj.finCode := Low(Integer) ;





  end;
end;

procedure TfrmENManningTableFilterEdit.spbENPositionPositionClick(Sender : TObject);
var 
   frmENPositionShow: TfrmENPositionShow;
begin
   frmENPositionShow:=TfrmENPositionShow.Create(Application,fmNormal);
   try
      with frmENPositionShow do
        if ShowModal = mrOk then
        begin
            try
               if ENManningTableFilterObj.position = nil then ENManningTableFilterObj.position := ENPosition.Create();
               ENManningTableFilterObj.position.code := StrToInt(GetReturnValue(sgENPosition,0));
               edtENPositionPositionName.Text:=GetReturnValue(sgENPosition,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPositionShow.Free;
   end;
end;


procedure TfrmENManningTableFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENManningTableFilterObj.department = nil then ENManningTableFilterObj.department := ENDepartment.Create();
               ENManningTableFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgENDepartment,0));
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName; //GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;





end.