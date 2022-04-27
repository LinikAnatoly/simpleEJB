
unit EditENDepartment;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
	  EnergyproController, EnergyproController2, ENDepartmentController;

type
  TfrmENDepartmentEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblShortName : TLabel;
    edtShortName: TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


  HTTPRIOENDepartment: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtIsVirtual: TCheckBox;
    lblENDepartmentName: TLabel;
    edtENDepartmentName: TEdit;
    spbENDepartment: TSpeedButton;
    edtDepartmentType: TComboBox;
    lblDepartmentType: TLabel;
    lblBalans: TLabel;
    spbBalans: TSpeedButton;
    edtBalans: TEdit;
    spbBalanseClear: TSpeedButton;
    gbKau1884: TGroupBox;
    spbKau1884: TSpeedButton;
    spbKau1884Clear: TSpeedButton;
    edtKau1884: TEdit;
    edtKauName1884: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbBalansClick(Sender: TObject);
    procedure spbBalanseClearClick(Sender: TObject);
    procedure spbKau1884Click(Sender: TObject);
    procedure spbKau1884ClearClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDepartmentEdit: TfrmENDepartmentEdit;
  ENDepartmentObj: ENDepartment;

implementation

uses ShowENDepartment, ENDepartmentTypeController,
     BalansController, ShowBalans, ShowKau, KauController;


{uses  
    EnergyproController, EnergyproController2, ENDepartmentController  ;
}
{$R *.dfm}



procedure TfrmENDepartmentEdit.FormShow(Sender: TObject);
var TempENDepartment: ENDepartmentControllerSoapPort;
begin

  DisableControls([edtENDepartmentName, spbENDepartment, edtDepartmentType]);

  if ENDepartmentObj.typeRef <> nil then
  begin
     edtDepartmentType.ItemIndex := ENDepartmentObj.typeRef.code - 1;
     frmENDepartmentEdit.Caption := edtDepartmentType.Text;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
      ,edtIsVirtual
      ,edtBalans
      ,edtKau1884
      ,edtKauName1884
     ]);
   end;

  if (DialogState = dsView) then
  begin
     DisableControls([spbBalans, spbBalanseClear, spbKau1884, spbKau1884Clear]);
  end;

if (DialogState = dsInsert) then
begin
        if ENDepartmentObj.parentRef <> nil then
        if ENDepartmentObj.parentRef.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtENDepartmentName.Text := TempENDepartment.getObject(ENDepartmentObj.parentRef.code).shortName;
        end;
        if ENDepartmentObj.typeRef <> nil then
        if ENDepartmentObj.typeRef.code <> low(Integer) then
        begin
           edtDepartmentType.ItemIndex := ENDepartmentObj.typeRef.code - 1;
        end;
end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENDepartmentObj.name; 
    edtShortName.Text := ENDepartmentObj.shortName;

    edtIsVirtual.Checked := ( ENDepartmentObj.isVirtual = 1 );
    {
    if ( ENDepartmentObj.isVirtual <> Low(Integer) ) then
       //edtIsVirtual.Text := IntToStr(ENDepartmentObj.isVirtual)
    else
       edtIsVirtual.Text := '';
    }

    edtBalans.Text := ENDepartmentObj.shpzBalans;
    edtKau1884.Text := ENDepartmentObj.kau_1884;
    edtKauName1884.Text := ENDepartmentObj.name_1884;

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

      if ENDepartmentObj.typeRef <> nil then
        edtDepartmentType.ItemIndex := ENDepartmentObj.typeRef.code - 1;

      if ENDepartmentObj.parentRef <> nil then
        if ENDepartmentObj.parentRef.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtENDepartmentName.Text := TempENDepartment.getObject(ENDepartmentObj.parentRef.code).shortName;
        end;

  end;
end;



procedure TfrmENDepartmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDepartment: ENDepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtShortName
      ,edtIsVirtual
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;


     ENDepartmentObj.name := edtName.Text; 

     ENDepartmentObj.shortName := edtShortName.Text; 

     ENDepartmentObj.isVirtual := ord(edtIsVirtual.Checked);

     ENDepartmentObj.shpzBalans := edtBalans.text;
     
     {
     if ( edtIsVirtual.Text <> '' ) then
       ENDepartmentObj.isVirtual := StrToInt(edtIsVirtual.Text)
     else
       ENDepartmentObj.isVirtual := Low(Integer) ;
     }

     if edtdateStart.checked then
     begin 
       if ENDepartmentObj.dateStart = nil then
          ENDepartmentObj.dateStart := TXSDate.Create;
       ENDepartmentObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENDepartmentObj.dateStart := nil;

     if edtdateFinal.checked then
     begin 
       if ENDepartmentObj.dateFinal = nil then
          ENDepartmentObj.dateFinal := TXSDate.Create;
       ENDepartmentObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENDepartmentObj.dateFinal := nil;

    if ENDepartmentObj.typeRef = nil then
       ENDepartmentObj.typeRef := ENDepartmentTypeRef.Create;
    ENDepartmentObj.typeRef.code := edtDepartmentType.ItemIndex + 1;

    if DialogState = dsInsert then
    begin
      ENDepartmentObj.code:=low(Integer);
      TempENDepartment.add(ENDepartmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDepartment.save(ENDepartmentObj);
    end;
  end;
end;


procedure TfrmENDepartmentEdit.spbENDepartmentClick(Sender: TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
{
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDepartmentObj.parentRef = nil then ENDepartmentObj.parentRef := ENDepartmentRef.Create();
               ENDepartmentObj.parentRef.code := StrToInt(GetReturnValue(sgENDepartment,0));
               edtENDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
   }
end;

procedure TfrmENDepartmentEdit.spbBalansClick(Sender: TObject);
var
   frmBalansShow : TfrmBalansShow;
   f : BalansFilter;
begin
   f := BalansFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.conditionSQL := ' balans.invisible is null ';

   frmBalansShow := TfrmBalansShow.Create(Application, fmNormal, f);
   DisableActions([frmBalansShow.actInsert, frmBalansShow.actEdit,
        frmBalansShow.actDelete, frmBalansShow.actView], true);

   try
      with frmBalansShow do
        if ShowModal = mrOk then
        begin
            try
                edtBalans.Text := GetReturnValue(sgBalans, 1);
                ENDepartmentObj.shpzBalans := GetReturnValue(sgBalans, 1);
                ENDepartmentObj.shpzFinId := StrToInt(GetReturnValue(sgBalans, 0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmBalansShow.Free;
   end;
   
end;

procedure TfrmENDepartmentEdit.spbBalanseClearClick(Sender: TObject);
begin
  inherited;
    edtBalans.Text := '';
    ENDepartmentObj.shpzBalans := '';
    ENDepartmentObj.shpzFinId := LOW_INT;
end;


procedure TfrmENDepartmentEdit.spbKau1884Click(Sender: TObject);
var
   frmKauShow : TfrmKauShow;
   f : KauFilter;
begin
   f := KauFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.kau_table_id := 1884;

   frmKauShow := TfrmKauShow.Create(Application, fmNormal, f);
   DisableActions([frmKauShow.actInsert, frmKauShow.actEdit,
        frmKauShow.actDelete, frmKauShow.actView], true);

   try
      with frmKauShow do
        if ShowModal = mrOk then
        begin
            try
                edtKau1884.Text := GetReturnValue(sgKau, 2);
                edtKauName1884.Text := GetReturnValue(sgKau, 3);
                ENDepartmentObj.kau_table_id_1884 := StrToInt(GetReturnValue(sgKau, 1));
                ENDepartmentObj.kau_1884 := edtKau1884.Text;
                ENDepartmentObj.name_1884 := edtKauName1884.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmKauShow.Free;
   end;
   
end;


procedure TfrmENDepartmentEdit.spbKau1884ClearClick(Sender: TObject);
begin
  inherited;
     edtKau1884.Text := '';
     edtKauName1884.Text := '';
     ENDepartmentObj.kau_table_id_1884 := LOW_INT;
     ENDepartmentObj.kau_1884 := '';
     ENDepartmentObj.name_1884 := '';
end;


end.
