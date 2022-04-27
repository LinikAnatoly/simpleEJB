
unit EditENPreproductionObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPreproductionObjectController ;

type
  TfrmENPreproductionObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENPreproductionObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblInvNumber: TLabel;
    lblBuhName: TLabel;
    edtBuhName: TEdit;
    edtInvNumber: TEdit;
    spbOSSelect: TSpeedButton;
    gbObjectType: TGroupBox;
    rdbOS: TRadioButton;
    rdbMaterials: TRadioButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPreproductionObjectEdit: TfrmENPreproductionObjectEdit;
  ENPreproductionObjectObj: ENPreproductionObject;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowTMatherial, ShowOStable, OSTableController, TMaterialController,
  ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;

{$R *.dfm}



procedure TfrmENPreproductionObjectEdit.FormShow(Sender: TObject);
var
TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin

   DisableControls([edtBuhName, edtInvNumber , edtGeograph ]);

  if DialogState = dsView then
  begin
    DisableControls([
      edtENElementElementName
      ,spbENElementElement
      , spbOSSelect
      , rdbMaterials
      , rdbOS
      , btnGeograph
      , btnGeographClear
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENPreproductionObjectObj.element.geoDepartmentRef <> nil then
      if ENPreproductionObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
       // geodept
            TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
          try
            ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENPreproductionObjectObj.element.geoDepartmentRef.code );
            edtGeograph.Text := ENGeographicDepartmentObj.name;
          except
            on EConvertError do Exit;
          end;
       end;

    edtCode.Text := IntToStr(ENPreproductionObjectObj.code);
    edtName.Text := ENPreproductionObjectObj.name; 
    MakeMultiline(edtCommentGen.Lines, ENPreproductionObjectObj.commentGen);
    edtUserGen.Text := ENPreproductionObjectObj.userGen; 
      if ENPreproductionObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPreproductionObjectObj.dateEdit.Year,ENPreproductionObjectObj.dateEdit.Month,ENPreproductionObjectObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

      edtBuhName.Text := ENPreproductionObjectObj.buhName;
      edtInvNumber.Text := ENPreproductionObjectObj.invNumber;

      if Length(ENPreproductionObjectObj.invNumber) > 6 then
        rdbMaterials.Checked := True
      else
        rdbOS.Checked := True;

  end;
end;



procedure TfrmENPreproductionObjectEdit.btnGeographClearClick(Sender: TObject);
begin
    ENPreproductionObjectObj.element.geoDepartmentRef.code := LOW_INT;
    edtGeograph.Text := '';

end;

procedure TfrmENPreproductionObjectEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENPreproductionObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENPreproductionObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPreproductionObject := HTTPRIOENPreproductionObject as ENPreproductionObjectControllerSoapPort;


     ENPreproductionObjectObj.name := edtName.Text; 

     ENPreproductionObjectObj.commentGen := edtCommentGen.Text; 


     if edtBuhName.Text <> '' then
     begin
       ENPreproductionObjectObj.invNumber := edtInvNumber.Text;
       ENPreproductionObjectObj.buhName := edtBuhName.Text;
     end;

{
     ENPreproductionObjectObj.userGen := edtUserGen.Text;

     if edtdateEdit.checked then
     begin
       if ENPreproductionObjectObj.dateEdit = nil then
          ENPreproductionObjectObj.dateEdit := TXSDate.Create;
       ENPreproductionObjectObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPreproductionObjectObj.dateEdit := nil;
}
    if DialogState = dsInsert then
    begin
      ENPreproductionObjectObj.code:=low(Integer);
      TempENPreproductionObject.add(ENPreproductionObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPreproductionObject.save(ENPreproductionObjectObj);
    end;
  end;
end;


procedure TfrmENPreproductionObjectEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPreproductionObjectObj.element = nil then ENPreproductionObjectObj.element := ENElement.Create();
               ENPreproductionObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENPreproductionObjectEdit.spbOSSelectClick(Sender: TObject);
var
  frmOSTableShow: TfrmOSTableShow;
  f: OStableFilter;

  frmTMatherialShow: TfrmTMatherialShow;
  fMaterial: TMaterialFilter;
begin
  if rdbOS.Checked then // Выбор из основных
  begin
    f := OStableFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.conditionSQL := ' OSTABLE.KOD_VID in (1, 2, 3, 11, 13, 15, 24, 38) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ (11) ...

    if length(edtInvNumber.Text) > 0 then
      f.kod_inv := '*' + edtInvNumber.Text + '*';

    f.orderBySQL :=  'OSTABLE.STR_NAME';

    frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
    //frmOSTableShow.SendType := 444; /// для энерго ....
    try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
          try
            //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
            edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
            edtBuhName.Text := GetReturnValue(sgOSTable,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmOSTableShow.Free;
    end;
  end
  else begin // Выбор из материалов
    fMaterial := TMaterialFilter.Create;
    SetNullIntProps(fMaterial);
    SetNullXSProps(fMaterial);

    if length(edtInvNumber.Text) > 0 then
      fMaterial.nn := '*' + edtInvNumber.Text + '*';
    fMaterial.conditionSQL := 'TMATHERIAL.STATUS = ''A''';
    fMaterial.orderBySQL :=  'TMATHERIAL.NAME';

    frmTMatherialShow := TfrmTMatherialShow.Create(Application, fmNormal, fMaterial);
    try
      with frmTMatherialShow do
        if ShowModal = mrOk then
        begin
          try
            edtInvNumber.Text := GetReturnValue(sgTMatherial,3);
            edtBuhName.Text := GetReturnValue(sgTMatherial,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmTMatherialShow.Free;
    end;
  end;
end;

end.