
unit ShowTKTransportReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  TKTransportRealController, AdvObj ;


type
  TfrmTKTransportRealShow = class(TChildForm)  
  HTTPRIOTKTransportReal: THTTPRIO;
    ImageList1: TImageList;
    sgTKTransportReal: TAdvStringGrid;
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
    actExportExcell: TAction;
    miN5: TMenuItem;
    miN6: TMenuItem;
    actChangeDriverTkPosition: TAction;
    N5: TMenuItem;
    miChangeDriverTkPosition: TMenuItem;
    actCopy: TAction;
    mniCopy: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgTKTransportRealTopLeftChanged(Sender: TObject);
procedure sgTKTransportRealDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actExportExcellExecute(Sender: TObject);
    procedure actChangeDriverTkPositionExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmTKTransportRealShow : TfrmTKTransportRealShow;
 // TKTransportRealObj: TKTransportReal;
 // TKTransportRealFilterObj: TKTransportRealFilter;
  
  
implementation

uses Main, EditTKTransportReal, EditTKTransportRealFilter, DMReportsUnit,
  ShowTKPosition, TKPositionController;


{$R *.dfm}

var
  //frmTKTransportRealShow : TfrmTKTransportRealShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  TKTransportRealHeaders: array [1..16] of String =
        ( 'Код'
          ,'Назва'
          ,'Інв. номер '
          ,'Держ. номер '
          ,'Бух. назва'
          ,'Марка'
          , 'Тип под. листа '
          , 'Тип палива'
          , 'Витр. пробіг'
          , 'Витр. маш/год'
          ,'РЕМ'
          ,'Закріплений '
          ,'Підрозділ транспорту'
          ,'МОЛ'
          , 'Максимальна вантажність, кг.'
          , 'Споряджена маса, кг.'
        );


procedure TfrmTKTransportRealShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmTKTransportRealShow:=nil;
    inherited;
  end;


procedure TfrmTKTransportRealShow.FormShow(Sender: TObject);
var
  TempTKTransportReal: TKTransportRealControllerSoapPort;
  i: Integer;
  TKTransportRealList: TKTransportRealShortList;
  begin
  SetGridHeaders(TKTransportRealHeaders, sgTKTransportReal.ColumnHeaders);
  ColCount:=100;
  TempTKTransportReal :=  HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := TKTransportRealFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  TKTransportRealList := TempTKTransportReal.getScrollableFilteredList(TKTransportRealFilter(FilterObject),0,ColCount);


  LastCount:=High(TKTransportRealList.list);

  if LastCount > -1 then
     sgTKTransportReal.RowCount:=LastCount+2
  else
     sgTKTransportReal.RowCount:=2;

   with sgTKTransportReal do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if TKTransportRealList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(TKTransportRealList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := TKTransportRealList.list[i].buhName;

        Cells[2,i+1] := TKTransportRealList.list[i].invNumber;
        Cells[3,i+1] := TKTransportRealList.list[i].gosNumber;

        Cells[4,i+1] := TKTransportRealList.list[i].name;

        Cells[5,i+1] := TKTransportRealList.list[i].transportmarkName;

        Cells[6,i+1] := TKTransportRealList.list[i].travelSheetTypeRefName;
        Cells[7,i+1] := TKTransportRealList.list[i].fuelTypeName;

        if TKTransportRealList.list[i].rashodProbeg <> nil then
          Cells[8,i+1] := TKTransportRealList.list[i].rashodProbeg.DecimalString
        else
          Cells[8,i+1] := '';

        if TKTransportRealList.list[i].rashodWork <> nil then
          Cells[9,i+1] := TKTransportRealList.list[i].rashodWork.DecimalString
        else
          Cells[9,i+1] := '';

        Cells[10,i+1] := TKTransportRealList.list[i].renName;
        Cells[11,i+1] := TKTransportRealList.list[i].departmentRefShortName;

        Cells[12,i+1] := TKTransportRealList.list[i].transportdepartmentRefName;
        Cells[13,i+1] := TKTransportRealList.list[i].finMolCode;

        if TKTransportRealList.list[i].capacity <> nil then
          Cells[14,i+1] := TKTransportRealList.list[i].capacity.DecimalString
        else
          Cells[14,i+1] := '';

        if TKTransportRealList.list[i].ladenMass <> nil then
          Cells[15,i+1] := TKTransportRealList.list[i].ladenMass.DecimalString
        else
          Cells[15,i+1] := '';


        LastRow:=i+1;
        sgTKTransportReal.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgTKTransportReal.Row:=1;
end;

procedure TfrmTKTransportRealShow.sgTKTransportRealTopLeftChanged(Sender: TObject);
var
  TempTKTransportReal: TKTransportRealControllerSoapPort;
  i,CurrentRow: Integer;
  TKTransportRealList: TKTransportRealShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgTKTransportReal.TopRow + sgTKTransportReal.VisibleRowCount) = ColCount
  then
    begin
      TempTKTransportReal :=  HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
      CurrentRow:=sgTKTransportReal.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := TKTransportRealFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  TKTransportRealList := TempTKTransportReal.getScrollableFilteredList(TKTransportRealFilter(FilterObject),ColCount-1, 100);



  sgTKTransportReal.RowCount:=sgTKTransportReal.RowCount+100;
  LastCount:=High(TKTransportRealList.list);
  with sgTKTransportReal do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if TKTransportRealList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(TKTransportRealList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := TKTransportRealList.list[i].buhName;
        Cells[2,i+CurrentRow] := TKTransportRealList.list[i].invNumber;
        Cells[3,i+CurrentRow] := TKTransportRealList.list[i].gosNumber;

        Cells[4,i+CurrentRow] := TKTransportRealList.list[i].name;

        Cells[5,i+CurrentRow] := TKTransportRealList.list[i].transportmarkName;

        Cells[6,i+CurrentRow] := TKTransportRealList.list[i].travelSheetTypeRefName;
        Cells[7,i+CurrentRow] := TKTransportRealList.list[i].fuelTypeName;

        if TKTransportRealList.list[i].rashodProbeg <> nil then
          Cells[8,i+CurrentRow] := TKTransportRealList.list[i].rashodProbeg.DecimalString
        else
          Cells[8,i+CurrentRow] := '';

        if TKTransportRealList.list[i].rashodWork <> nil then
          Cells[9,i+CurrentRow] := TKTransportRealList.list[i].rashodWork.DecimalString
        else
          Cells[9,i+CurrentRow] := '';

        Cells[10,i+CurrentRow] := TKTransportRealList.list[i].renName;
        Cells[11,i+CurrentRow] := TKTransportRealList.list[i].departmentRefShortName;

         Cells[12,i+CurrentRow] := TKTransportRealList.list[i].transportdepartmentRefName;
        Cells[13,i+CurrentRow] := TKTransportRealList.list[i].finMolCode;

        if TKTransportRealList.list[i].capacity <> nil then
          Cells[14,i+CurrentRow] := TKTransportRealList.list[i].capacity.DecimalString
        else
          Cells[14,i+CurrentRow] := '';

        if TKTransportRealList.list[i].ladenMass <> nil then
          Cells[15,i+CurrentRow] := TKTransportRealList.list[i].ladenMass.DecimalString
        else
          Cells[15,i+CurrentRow] := '';

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgTKTransportReal.Row:=CurrentRow-5;
   sgTKTransportReal.RowCount:=LastRow+1;
  end;
end;

procedure TfrmTKTransportRealShow.sgTKTransportRealDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgTKTransportReal,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmTKTransportRealShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgTKTransportReal.RowCount-1 do
   for j:=0 to sgTKTransportReal.ColCount-1 do
     sgTKTransportReal.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmTKTransportRealShow.actViewExecute(Sender: TObject);
Var TempTKTransportReal: TKTransportRealControllerSoapPort;
begin
 TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
   try
     TKTransportRealObj := TempTKTransportReal.getObject(StrToInt(sgTKTransportReal.Cells[0,sgTKTransportReal.Row]));
   except
   on EConvertError do Exit;
  end;
  frmTKTransportRealEdit:=TfrmTKTransportRealEdit.Create(Application, dsView);
  try
    frmTKTransportRealEdit.ShowModal;
  finally
    frmTKTransportRealEdit.Free;
    frmTKTransportRealEdit:=nil;
  end;
end;

procedure TfrmTKTransportRealShow.actEditExecute(Sender: TObject);
Var TempTKTransportReal: TKTransportRealControllerSoapPort;
begin
 TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
   try
     TKTransportRealObj := TempTKTransportReal.getObject(StrToInt(sgTKTransportReal.Cells[0,sgTKTransportReal.Row]));
   except
   on EConvertError do Exit;
  end;
  frmTKTransportRealEdit:=TfrmTKTransportRealEdit.Create(Application, dsEdit);
  try
    if frmTKTransportRealEdit.ShowModal= mrOk then
      begin
        //TempTKTransportReal.save(TKTransportRealObj);
        UpdateGrid(Sender);
      end;
  finally
    frmTKTransportRealEdit.Free;
    frmTKTransportRealEdit:=nil;
  end;
end;

procedure TfrmTKTransportRealShow.actChangeDriverTkPositionExecute(
  Sender: TObject);
 var
   frmTKPositionShow : TfrmTKPositionShow;
   TempTKTransportReal: TKTransportRealControllerSoapPort;
   transpRealObj : TKTransportReal;
begin
   TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
   try
     transpRealObj := TempTKTransportReal.getObject(StrToInt(sgTKTransportReal.Cells[0,sgTKTransportReal.Row]));
   except
   on EConvertError do Exit;
  end;

   frmTKPositionShow:=TfrmTKPositionShow.Create(Application,fmNormal);
   try
      with frmTKPositionShow do
        if ShowModal = mrOk then
        begin
            try
               if transpRealObj.positionRef = nil then transpRealObj.positionRef := TKPositionRef.Create();
                  transpRealObj.positionRef.code := StrToInt(GetReturnValue(sgTKPosition,0));

                  if Application.MessageBox(PChar('Дійсно занести/змінити нормативну посаду водія ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
                  begin
                     TempTKTransportReal.addOrUpdateTkPosition(transpRealObj);
				             UpdateGrid(Sender);
                  end;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKPositionShow.Free;
   end;
end;

procedure TfrmTKTransportRealShow.actCopyExecute(Sender: TObject);
var
  TempTKTransportReal: TKTransportRealControllerSoapPort;
begin
  inherited;
  TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
  try
     TKTransportRealObj := TempTKTransportReal.getObject(StrToInt(sgTKTransportReal.Cells[0,sgTKTransportReal.Row]));
   except
   on EConvertError do Exit;
  end;
  if TKTransportRealObj = nil then Exit;
  TKTransportRealObj.code := Low(Integer);
  try
    frmTKTransportRealEdit:=TfrmTKTransportRealEdit.Create(Application, dsEdit);
    frmTKTransportRealEdit.isForCopy := true;
    try
      if frmTKTransportRealEdit.ShowModal = mrOk then
      begin
        if TKTransportRealObj<>nil then
            //TempTKTransportReal.add(TKTransportRealObj);
            UpdateGrid(Sender);
      end;
    finally
      frmTKTransportRealEdit.Free;
      frmTKTransportRealEdit:=nil;
    end;
  finally
    TKTransportRealObj.Free;
  end;
end;

procedure TfrmTKTransportRealShow.actDeleteExecute(Sender: TObject);
Var TempTKTransportReal: TKTransportRealControllerSoapPort;
  ObjCode: Integer;
begin
 TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
   try
     ObjCode := StrToInt(sgTKTransportReal.Cells[0,sgTKTransportReal.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Реальные машины) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempTKTransportReal.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmTKTransportRealShow.actInsertExecute(Sender: TObject);
Var TempTKTransportReal: TKTransportRealControllerSoapPort;
begin
  TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
  TKTransportRealObj:=TKTransportReal.Create;



  try
    frmTKTransportRealEdit:=TfrmTKTransportRealEdit.Create(Application, dsInsert);
    try
      if frmTKTransportRealEdit.ShowModal = mrOk then
      begin
        if TKTransportRealObj<>nil then
            //TempTKTransportReal.add(TKTransportRealObj);
            UpdateGrid(Sender);
      end;
    finally
      frmTKTransportRealEdit.Free;
      frmTKTransportRealEdit:=nil;
    end;
  finally
    TKTransportRealObj.Free;
  end;
end;

procedure TfrmTKTransportRealShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmTKTransportRealShow.actFilterExecute(Sender: TObject);
begin
frmTKTransportRealFilterEdit:=TfrmTKTransportRealFilterEdit.Create(Application, dsEdit);
  try
    TKTransportRealFilterObj := TKTransportRealFilter.Create;
    SetNullIntProps(TKTransportRealFilterObj);
    SetNullXSProps(TKTransportRealFilterObj);
    {
    if TKTransportRealFilter(FilterObject) <> nil then
      if TKTransportRealFilter(FilterObject).departmentRef <> nil then
        if TKTransportRealFilter(FilterObject).departmentRef.code > Low(Integer) then
        begin
          TKTransportRealFilterObj.conditionSQL := 'endepartment.rencode = ' + IntToStr(TKTransportRealFilter(FilterObject).departmentRef.code);
          frmTKTransportRealFilterEdit.edtDepartment.Text := 'filtered :)';
        end;
    }

    if frmTKTransportRealFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := TKTransportRealFilter.Create;
      FilterObject := TKTransportRealFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmTKTransportRealFilterEdit.Free;
    frmTKTransportRealFilterEdit:=nil;
  end;
end;

procedure TfrmTKTransportRealShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmTKTransportRealShow.actExportExcellExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку ... '+#10#13+' Зберегти в Ексель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgTKTransportReal, 'Список_транпортних_засобів');
  end;
end;

end.