
unit ShowENFuelSheetVolumes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuelSheetVolumesController, AdvObj ;


type
  TfrmENFuelSheetVolumesShow = class(TChildForm)  
  HTTPRIOENFuelSheetVolumes: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelSheetVolumes: TAdvStringGrid;
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
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N5: TMenuItem;
    actApprove: TAction;
    actUndoApprove: TAction;
    N9: TMenuItem;
    N10: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENFuelSheetVolumesTopLeftChanged(Sender: TObject);
procedure sgENFuelSheetVolumesDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actApproveExecute(Sender: TObject);
    procedure actUndoApproveExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENFuelSheetVolumesObj: ENFuelSheetVolumes;
 // ENFuelSheetVolumesFilterObj: ENFuelSheetVolumesFilter;
  
  
implementation

uses Main, EditENFuelSheetVolumes, EditENFuelSheetVolumesFilter, ENConsts;


{$R *.dfm}

var
  //frmENFuelSheetVolumesShow : TfrmENFuelSheetVolumesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelSheetVolumesHeaders: array [1..9] of String =
        ( 'Код'
          ,'Назва'
          //,'Дата відомості'
          ,'Період'
          ,'Тип ПММ'
          ,'Статус'
          //,'Дата початку'
          //,'Дата закінчення'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENFuelSheetVolumesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuelSheetVolumesShow:=nil;
    inherited;
  end;


procedure TfrmENFuelSheetVolumesShow.FormShow(Sender: TObject);
var
  TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
  i: Integer;
  ENFuelSheetVolumesList: ENFuelSheetVolumesShortList;
  begin
  SetGridHeaders(ENFuelSheetVolumesHeaders, sgENFuelSheetVolumes.ColumnHeaders);
  ColCount:=100;
  TempENFuelSheetVolumes :=  HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelSheetVolumesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;


  ENFuelSheetVolumesFilter(FilterObject).orderBySQL := ' enfuelsheetvolumes.dategen desc, enfuelsheetvolumes.CODE desc ';

  ENFuelSheetVolumesList := TempENFuelSheetVolumes.getScrollableFilteredList(ENFuelSheetVolumesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuelSheetVolumesList.list);

  if LastCount > -1 then
     sgENFuelSheetVolumes.RowCount:=LastCount+2
  else
     sgENFuelSheetVolumes.RowCount:=2;

{
        ( 'Код'
          ,'Назва'
          //,'Дата відомості'
          ,'Період'
          ,'Тип ПММ'
          ,'Статус'
          //,'Дата початку'
          //,'Дата закінчення'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
}

   with sgENFuelSheetVolumes do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelSheetVolumesList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENFuelSheetVolumesList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENFuelSheetVolumesList.list[i].name;

        {
        if ENFuelSheetVolumesList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENFuelSheetVolumesList.list[i].dateGen);
        }

        if ENFuelSheetVolumesList.list[i].startDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := MonthesNames[ENFuelSheetVolumesList.list[i].startDate.Month] + ' ' +
                          IntToStr(ENFuelSheetVolumesList.list[i].startDate.Year) + ', ' +
                          IntToStr(getDecadeNumber(ENFuelSheetVolumesList.list[i].startDate)) + ' декада';

        Cells[3,i+1] := ENFuelSheetVolumesList.list[i].fuelTypeName;
        Cells[4,i+1] := ENFuelSheetVolumesList.list[i].statusRefName;

        {
        if ENFuelSheetVolumesList.list[i].startDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENFuelSheetVolumesList.list[i].startDate);
        if ENFuelSheetVolumesList.list[i].endDate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENFuelSheetVolumesList.list[i].endDate);
        }

        Cells[5,i+1] := ENFuelSheetVolumesList.list[i].userAdd;
        if ENFuelSheetVolumesList.list[i].dateAdd = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENFuelSheetVolumesList.list[i].dateAdd);

        Cells[7,i+1] := ENFuelSheetVolumesList.list[i].userGen;
        if ENFuelSheetVolumesList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDateTimeWithDate2String(ENFuelSheetVolumesList.list[i].dateEdit);

        LastRow := i + 1;

        sgENFuelSheetVolumes.RowCount := LastRow + 1;
      end;
   ColCount:=ColCount+1;
   sgENFuelSheetVolumes.Row:=1;
end;

procedure TfrmENFuelSheetVolumesShow.sgENFuelSheetVolumesTopLeftChanged(Sender: TObject);
var
  TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelSheetVolumesList: ENFuelSheetVolumesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelSheetVolumes.TopRow + sgENFuelSheetVolumes.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelSheetVolumes :=  HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;
      CurrentRow:=sgENFuelSheetVolumes.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelSheetVolumesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelSheetVolumesList := TempENFuelSheetVolumes.getScrollableFilteredList(ENFuelSheetVolumesFilter(FilterObject),ColCount-1, 100);



  sgENFuelSheetVolumes.RowCount:=sgENFuelSheetVolumes.RowCount+100;
  LastCount:=High(ENFuelSheetVolumesList.list);
  with sgENFuelSheetVolumes do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENFuelSheetVolumesList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENFuelSheetVolumesList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFuelSheetVolumesList.list[i].name;

        {
        if ENFuelSheetVolumesList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENFuelSheetVolumesList.list[i].dateGen);
        }

        if ENFuelSheetVolumesList.list[i].startDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := MonthesNames[ENFuelSheetVolumesList.list[i].startDate.Month] + ' ' +
                          IntToStr(ENFuelSheetVolumesList.list[i].startDate.Year) + ', ' +
                          IntToStr(getDecadeNumber(ENFuelSheetVolumesList.list[i].startDate)) + ' декада';

        Cells[3,i+CurrentRow] := ENFuelSheetVolumesList.list[i].fuelTypeName;
        Cells[4,i+CurrentRow] := ENFuelSheetVolumesList.list[i].statusRefName;

        {
        if ENFuelSheetVolumesList.list[i].startDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENFuelSheetVolumesList.list[i].startDate);
        if ENFuelSheetVolumesList.list[i].endDate = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENFuelSheetVolumesList.list[i].endDate);
        }

        Cells[5,i+CurrentRow] := ENFuelSheetVolumesList.list[i].userAdd;
        if ENFuelSheetVolumesList.list[i].dateAdd = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelSheetVolumesList.list[i].dateAdd);

        Cells[7,i+CurrentRow] := ENFuelSheetVolumesList.list[i].userGen;
        if ENFuelSheetVolumesList.list[i].dateEdit = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelSheetVolumesList.list[i].dateEdit);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelSheetVolumes.Row:=CurrentRow-5;
   sgENFuelSheetVolumes.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelSheetVolumesShow.sgENFuelSheetVolumesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelSheetVolumes,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuelSheetVolumesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuelSheetVolumes.RowCount-1 do
   for j:=0 to sgENFuelSheetVolumes.ColCount-1 do
     sgENFuelSheetVolumes.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuelSheetVolumesShow.actViewExecute(Sender: TObject);
Var TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
begin
 TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;
   try
     ENFuelSheetVolumesObj := TempENFuelSheetVolumes.getObject(StrToInt(sgENFuelSheetVolumes.Cells[0,sgENFuelSheetVolumes.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelSheetVolumesEdit:=TfrmENFuelSheetVolumesEdit.Create(Application, dsView);
  try
    frmENFuelSheetVolumesEdit.ShowModal;
  finally
    frmENFuelSheetVolumesEdit.Free;
    frmENFuelSheetVolumesEdit:=nil;
  end;
end;

procedure TfrmENFuelSheetVolumesShow.actEditExecute(Sender: TObject);
Var TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
begin
  TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;
  try
    ENFuelSheetVolumesObj := TempENFuelSheetVolumes.getObject(StrToInt(sgENFuelSheetVolumes.Cells[0, sgENFuelSheetVolumes.Row]));
  except
    on EConvertError do Exit;
  end;

  if ENFuelSheetVolumesObj.statusRef.code <> ENFUELSHEETVOLUMESSTATUS_DRAFT then
  begin
    Application.MessageBox(PChar('Ця відомість затверджена! Редагування заборонено!'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  frmENFuelSheetVolumesEdit := TfrmENFuelSheetVolumesEdit.Create(Application, dsEdit);
  try
    if frmENFuelSheetVolumesEdit.ShowModal = mrOk then
    begin
      //TempENFuelSheetVolumes.save(ENFuelSheetVolumesObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENFuelSheetVolumesEdit.Free;
    frmENFuelSheetVolumesEdit := nil;
  end;
end;

procedure TfrmENFuelSheetVolumesShow.actApproveExecute(Sender: TObject);
Var
  TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
  ObjCode: Integer;
  fuelSheetVolumesObj: ENFuelSheetVolumes;
begin
  try
    ObjCode := StrToInt(sgENFuelSheetVolumes.Cells[0, sgENFuelSheetVolumes.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;

  fuelSheetVolumesObj := TempENFuelSheetVolumes.getObject(ObjCode);

  if fuelSheetVolumesObj.statusRef.code <> ENFUELSHEETVOLUMESSTATUS_DRAFT then
  begin
    Application.MessageBox(PChar('Ця відомість вже затверджена!'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити відомість ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENFuelSheetVolumes.approve(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelSheetVolumesShow.actDeleteExecute(Sender: TObject);
Var
  TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
  ObjCode: Integer;
  fuelSheetVolumesObj: ENFuelSheetVolumes;
begin
  try
    ObjCode := StrToInt(sgENFuelSheetVolumes.Cells[0, sgENFuelSheetVolumes.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;

  fuelSheetVolumesObj := TempENFuelSheetVolumes.getObject(ObjCode);

  if fuelSheetVolumesObj.statusRef.code <> ENFUELSHEETVOLUMESSTATUS_DRAFT then
  begin
    Application.MessageBox(PChar('Ця відомість затверджена! Видалення заборонено!'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити відомість ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENFuelSheetVolumes.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelSheetVolumesShow.actInsertExecute(Sender: TObject);
// Var TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort; 
begin
  // TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelSheetVolumesObj:=ENFuelSheetVolumes.Create;

   //ENFuelSheetVolumesObj.dateGen:= TXSDate.Create;
   //ENFuelSheetVolumesObj.startDate:= TXSDate.Create;
   //ENFuelSheetVolumesObj.endDate:= TXSDate.Create;
   //ENFuelSheetVolumesObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENFuelSheetVolumesEdit:=TfrmENFuelSheetVolumesEdit.Create(Application, dsInsert);
    try
      if frmENFuelSheetVolumesEdit.ShowModal = mrOk then
      begin
        if ENFuelSheetVolumesObj<>nil then
            //TempENFuelSheetVolumes.add(ENFuelSheetVolumesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelSheetVolumesEdit.Free;
      frmENFuelSheetVolumesEdit:=nil;
    end;
  finally
    ENFuelSheetVolumesObj.Free;
  end;
end;

procedure TfrmENFuelSheetVolumesShow.actUndoApproveExecute(Sender: TObject);
Var
  TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
  ObjCode: Integer;
  fuelSheetVolumesObj: ENFuelSheetVolumes;
begin
  try
    ObjCode := StrToInt(sgENFuelSheetVolumes.Cells[0, sgENFuelSheetVolumes.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENFuelSheetVolumes := HTTPRIOENFuelSheetVolumes as ENFuelSheetVolumesControllerSoapPort;

  fuelSheetVolumesObj := TempENFuelSheetVolumes.getObject(ObjCode);

  if fuelSheetVolumesObj.statusRef.code <> ENFUELSHEETVOLUMESSTATUS_APPROVED then
  begin
    Application.MessageBox(PChar('Ця відомість не затверджена!'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження відомості ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENFuelSheetVolumes.undoApprove(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelSheetVolumesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuelSheetVolumesShow.actFilterExecute(Sender: TObject);
begin
  frmENFuelSheetVolumesFilterEdit := TfrmENFuelSheetVolumesFilterEdit.Create(Application, dsInsert);
  try
    ENFuelSheetVolumesFilterObj := ENFuelSheetVolumesFilter.Create;
    SetNullIntProps(ENFuelSheetVolumesFilterObj);
    SetNullXSProps(ENFuelSheetVolumesFilterObj);

    if frmENFuelSheetVolumesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuelSheetVolumesFilter.Create;
      FilterObject := ENFuelSheetVolumesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelSheetVolumesFilterEdit.Free;
    frmENFuelSheetVolumesFilterEdit := nil;
  end;
end;

procedure TfrmENFuelSheetVolumesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.