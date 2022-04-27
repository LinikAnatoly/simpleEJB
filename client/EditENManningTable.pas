
unit EditENManningTable;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENManningTableController ;

type
  TfrmENManningTableEdit = class(TDialogForm)

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
  frmENManningTableEdit: TfrmENManningTableEdit;
  ENManningTableObj: ENManningTable;

implementation

uses
  ShowENPosition
  ,ENPositionController
  ,ShowENDepartment
  ,ENDepartmentController
, ENDepartmentTypeController;

{uses  
    EnergyproController, EnergyproController2, ENManningTableController  ;
}
{$R *.dfm}



procedure TfrmENManningTableEdit.FormShow(Sender: TObject);

begin
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

    edtENPositionPositionName.Text := ENManningTableObj.position.name;
    edtENDepartmentDepartmentName.Text := ENManningTableObj.department.name;

  end;
end;



procedure TfrmENManningTableEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENManningTable: ENManningTableControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtFinCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENManningTable := HTTPRIOENManningTable as ENManningTableControllerSoapPort;


     ENManningTableObj.name := edtName.Text; 

     if edtdateStart.checked then
     begin 
       if ENManningTableObj.dateStart = nil then
          ENManningTableObj.dateStart := TXSDate.Create;
       ENManningTableObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENManningTableObj.dateStart := nil;

     if edtdateFinal.checked then
     begin 
       if ENManningTableObj.dateFinal = nil then
          ENManningTableObj.dateFinal := TXSDate.Create;
       ENManningTableObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENManningTableObj.dateFinal := nil;

     if ( edtFinCode.Text <> '' ) then
       ENManningTableObj.finCode := StrToInt(edtFinCode.Text)
     else
       ENManningTableObj.finCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENManningTableObj.code:=low(Integer);
      TempENManningTable.add(ENManningTableObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENManningTable.save(ENManningTableObj);
    end;
  end;
end;


procedure TfrmENManningTableEdit.spbENPositionPositionClick(Sender : TObject);
var 
   frmENPositionShow: TfrmENPositionShow;
begin
   frmENPositionShow:=TfrmENPositionShow.Create(Application,fmNormal);
   try
      with frmENPositionShow do
        if ShowModal = mrOk then
        begin
            try
               if ENManningTableObj.position = nil then ENManningTableObj.position := ENPosition.Create();
               ENManningTableObj.position.code := StrToInt(GetReturnValue(sgENPosition,0));
               edtENPositionPositionName.Text:=GetReturnValue(sgENPosition,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPositionShow.Free;
   end;
end;



procedure TfrmENManningTableEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := ENDEPARTMENTTYPE_DEPARTMENT;
   f.conditionSQL := 'typerefcode in (3,4,5)';  // только бригады или участки

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENManningTableObj.department = nil then ENManningTableObj.department := ENDepartment.Create();
               ENManningTableObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code; // StrToInt(GetReturnValue(sgENDepartment,0));
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName; // GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



end.