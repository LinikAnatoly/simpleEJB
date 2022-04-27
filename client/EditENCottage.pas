
unit EditENCottage;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENCottage2TKClassificationTypeController,
	  EnergyproController, EnergyproController2, ENCottageController, AdvObj, ENConsts,
    TKClassificationTypeController, EditTKClassificationType, ENRentPeriod2ServicesController;

type
    TfrmENCottageEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;


    HTTPRIOENCottage: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    pcENCottage: TPageControl;
    tsGeneral: TTabSheet;
    tsTKClassificationType: TTabSheet;
    edtNumberGen: TEdit;
    edtCommentgen: TMemo;
    lblCommentgen: TLabel;
    edtDescription: TMemo;
    lblDescription: TLabel;
    edtNumberBeds: TEdit;
    lblNumberBeds: TLabel;
    lblNumberGen: TLabel;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    sgENCottage2TKClassificationType: TAdvStringGrid;
    HTTPRIOENCottage2TKClassificationType: THTTPRIO;
    HTTPRIOTKClassificationType: THTTPRIO;
    tsRentPeriod: TTabSheet;
    sgENRentPeriod2Services: TAdvStringGrid;
    HTTPRIOENRentPeriod2Services: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcENCottageChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateGrid(Sender: TObject);

end;

var
  frmENCottageEdit: TfrmENCottageEdit;
  ENCottageObj: ENCottage;

implementation


uses ShowTKClassificationType;

{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCottage2TKClassificationTypeHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер'
          ,'Назва'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  ENRentPeriod2ServicesHeaders: array [1..4] of String =
        ( 'Код'
          ,'Початок проживання'
          ,'Кінець проживання'
          ,'№ договору'
        );


procedure TfrmENCottageEdit.FormShow(Sender: TObject);
begin

  pcENCottage.ActivePage := tsGeneral;
  tsTKClassificationType.TabVisible := (DialogState <> dsInsert);
  DisableControls([edtCode]);
  SetIntStyle([edtNumberBeds]);
  lblCode.Visible := (DialogState <> dsInsert);
  edtCode.Visible := (DialogState <> dsInsert);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtNumberGen, edtNumberBeds, edtDescription, edtCommentgen]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENCottageObj.code);
    edtNumberGen.Text := ENCottageObj.numberGen;

    if ( ENCottageObj.numberBeds <> Low(Integer) ) then
      edtNumberBeds.Text := IntToStr(ENCottageObj.numberBeds)
    else
      edtNumberBeds.Text := '';

    MakeMultiline(edtDescription.Lines, ENCottageObj.description);
    MakeMultiline(edtCommentgen.Lines, ENCottageObj.commentgen);
  end;
end;


procedure TfrmENCottageEdit.pcENCottageChange(Sender: TObject);
var
  TempENCottage2TKClassificationType : ENCottage2TKClassificationTypeControllerSoapPort;
  i : Integer;
  ENCottage2TKClassificationTypeList : ENCottage2TKClassificationTypeShortList;
  cottage2TKClassificationTypeFilter : ENCottage2TKClassificationTypeFilter;
  TempENRentPeriod2Services : ENRentPeriod2ServicesControllerSoapPort;
  ENRentPeriod2ServicesList : ENRentPeriod2ServicesShortList;
  rentPeriodFilter : ENRentPeriod2ServicesFilter;
begin
  inherited;
  if (pcENCottage.ActivePage = tsTKClassificationType) then
  begin
    SetGridHeaders(ENCottage2TKClassificationTypeHeaders, sgENCottage2TKClassificationType.ColumnHeaders);
    ColCount := 100;
    TempENCottage2TKClassificationType := HTTPRIOENCottage2TKClassificationType as ENCottage2TKClassificationTypeControllerSoapPort;

    cottage2TKClassificationTypeFilter := ENCottage2TKClassificationTypeFilter.Create;
    SetNullIntProps(cottage2TKClassificationTypeFilter);
    SetNullXSProps(cottage2TKClassificationTypeFilter);

    cottage2TKClassificationTypeFilter.cottageRef := ENCottageRef.Create;
    cottage2TKClassificationTypeFilter.cottageRef.code := ENCottageObj.code;

    ENCottage2TKClassificationTypeList := TempENCottage2TKClassificationType.getScrollableFilteredList(cottage2TKClassificationTypeFilter,0,ColCount);
    LastCount:=High(ENCottage2TKClassificationTypeList.list);

    if LastCount > -1 then
      sgENCottage2TKClassificationType.RowCount:=LastCount+2
    else
      sgENCottage2TKClassificationType.RowCount:=2;

     with sgENCottage2TKClassificationType do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENCottage2TKClassificationTypeList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENCottage2TKClassificationTypeList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENCottage2TKClassificationTypeList.list[i].classificationTypeRefKod;
          Cells[2,i+1] := ENCottage2TKClassificationTypeList.list[i].classificationTypeRefName;
          Cells[3,i+1] := ENCottage2TKClassificationTypeList.list[i].userGen;

          if ENCottage2TKClassificationTypeList.list[i].dateEdit = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := XSDateTimeWithDate2String(ENCottage2TKClassificationTypeList.list[i].dateEdit);

          LastRow:=i+1;
          sgENCottage2TKClassificationType.RowCount:=LastRow+1;
        end;
     ColCount:=ColCount+1;
     sgENCottage2TKClassificationType.Row:=1;

  end;

  if (pcENCottage.ActivePage = tsRentPeriod) then
  begin
    TempENRentPeriod2Services := HTTPRIOENRentPeriod2Services as ENRentPeriod2ServicesControllerSoapPort;
    SetGridHeaders(ENRentPeriod2ServicesHeaders, sgENRentPeriod2Services.ColumnHeaders);
    ColCount := 100;
    ClearGrid(sgENRentPeriod2Services);

    rentPeriodFilter := ENRentPeriod2ServicesFilter.Create;
    SetNullIntProps(rentPeriodFilter);
    SetNullXSProps(rentPeriodFilter);
    rentPeriodFilter.cottageRef := ENCottageRef.Create;
    rentPeriodFilter.cottageRef.code := ENCottageObj.code;
    rentPeriodFilter.orderBySQL := 'enrentperiod2services.startdate';

    ENRentPeriod2ServicesList := TempENRentPeriod2Services.getScrollableFilteredList(rentPeriodFilter,0,ColCount);
    LastCount:=High(ENRentPeriod2ServicesList.list);

    if LastCount > -1 then
      sgENRentPeriod2Services.RowCount:=LastCount+2
    else
      sgENRentPeriod2Services.RowCount:=2;

     with sgENRentPeriod2Services do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENRentPeriod2ServicesList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENRentPeriod2ServicesList.list[i].code)
          else
            Cells[0,i+1] := '';
          if ENRentPeriod2ServicesList.list[i].startDate = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := XSDate2String(ENRentPeriod2ServicesList.list[i].startDate);
          if ENRentPeriod2ServicesList.list[i].endDate = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(ENRentPeriod2ServicesList.list[i].endDate);

          Cells[3,i+1] := ENRentPeriod2ServicesList.list[i].servicesObjectRefContractNumberServices;

          LastRow:=i+1;
          sgENRentPeriod2Services.RowCount:=LastRow+1;
        end;
     ColCount:=ColCount+1;
     sgENRentPeriod2Services.Row:=1;
  end;
end;


procedure TfrmENCottageEdit.actDeleteExecute(Sender: TObject);
var
  TempENCottage2TKClassificationType: ENCottage2TKClassificationTypeControllerSoapPort;
  ObjCode: Integer;
begin
  inherited;
  TempENCottage2TKClassificationType := HTTPRIOENCottage2TKClassificationType as ENCottage2TKClassificationTypeControllerSoapPort;
  try
    ObjCode := StrToInt(sgENCottage2TKClassificationType.Cells[0,sgENCottage2TKClassificationType.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок котеджу з класифікацією робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENCottage2TKClassificationType.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENCottageEdit.actInsertExecute(Sender: TObject);
var
  frmTKClassificationTypeShow : TfrmTKClassificationTypeShow;
  TempENCottage2TKClassificationType : ENCottage2TKClassificationTypeControllerSoapPort;
  ENCottage2TKClassificationTypeObj : ENCottage2TKClassificationType;
begin
  inherited;
  if (ENCottageObj = nil) then Exit;
  if (ENCottageObj.code = low(Integer)) then Exit;

  frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
  try
    DisableActions([frmTKClassificationTypeShow.actNoFilter,
      frmTKClassificationTypeShow.actInsert, frmTKClassificationTypeShow.actEdit,
      frmTKClassificationTypeShow.actDelete]);

    frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);

    with frmTKClassificationTypeShow do
      if ShowModal = mrOk then
      begin
        try
          TempENCottage2TKClassificationType := HTTPRIOENCottage2TKClassificationType as ENCottage2TKClassificationTypeControllerSoapPort;
          ENCottage2TKClassificationTypeObj := ENCottage2TKClassificationType.Create;

          ENCottage2TKClassificationTypeObj.code := low(Integer);

          ENCottage2TKClassificationTypeObj.classificationTypeRef := TKClassificationTypeRef.Create;
          ENCottage2TKClassificationTypeObj.classificationTypeRef.code := TKClassificationTypeShort(tvDep.Selected.Data).code;

          ENCottage2TKClassificationTypeObj.cottageRef := ENCottageRef.Create;
          ENCottage2TKClassificationTypeObj.cottageRef.code := ENCottageObj.code;

          TempENCottage2TKClassificationType.add(ENCottage2TKClassificationTypeObj);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmTKClassificationTypeShow.Free;
  end;
  UpdateGrid(Sender);
end;


procedure TfrmENCottageEdit.actViewExecute(Sender: TObject);
var
  TempENCottage2TKClassificationType: ENCottage2TKClassificationTypeControllerSoapPort;
  ENCottage2TKClassificationTypeObj : ENCottage2TKClassificationType;
  TempClassificationType : TKClassificationTypeControllerSoapPort;
begin
  inherited;
  TempENCottage2TKClassificationType := HTTPRIOENCottage2TKClassificationType as ENCottage2TKClassificationTypeControllerSoapPort;
  try
    ENCottage2TKClassificationTypeObj := TempENCottage2TKClassificationType.getObject(StrToInt(sgENCottage2TKClassificationType.Cells[0,sgENCottage2TKClassificationType.Row]));
  except
    on EConvertError do Exit;
  end;

  TempClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
  try
    TKClassificationTypeObj := TempClassificationType.getObject(ENCottage2TKClassificationTypeObj.classificationTypeRef.code);
  except
    on EConvertError do Exit;
  end;

  frmTKClassificationTypeEdit := TfrmTKClassificationTypeEdit.Create(Application, dsView);
  try
    frmTKClassificationTypeEdit.ShowModal;
  finally
    frmTKClassificationTypeEdit.Free;
    frmTKClassificationTypeEdit:=nil;
  end;
end;


procedure TfrmENCottageEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCottage: ENCottageControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtNumberGen, edtNumberBeds])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENCottage := HTTPRIOENCottage as ENCottageControllerSoapPort;
    ENCottageObj.numberGen := edtNumberGen.Text;

    if ( edtNumberBeds.Text <> '' ) then
      ENCottageObj.numberBeds := StrToInt(edtNumberBeds.Text)
    else
      ENCottageObj.numberBeds := Low(Integer) ;

     ENCottageObj.description := edtDescription.Text;
     ENCottageObj.commentgen := edtCommentgen.Text;

    if DialogState = dsInsert then
    begin
      ENCottageObj.code:=low(Integer);
      TempENCottage.add(ENCottageObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCottage.save(ENCottageObj);
    end;
  end;
end;


procedure TfrmENCottageEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCottage2TKClassificationType.RowCount-1 do
   for j:=0 to sgENCottage2TKClassificationType.ColCount-1 do
     sgENCottage2TKClassificationType.Cells[j,i]:='';
   pcENCottageChange(Sender);
end;


end.
