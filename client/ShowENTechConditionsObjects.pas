
unit ShowENTechConditionsObjects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTechConditionsObjectsController, AdvObj ;


type
  TfrmENTechConditionsObjectsShow = class(TChildForm)
    ImageList1: TImageList;
    sgENTechConditionsObjects: TAdvStringGrid;
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
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    btnExportExcel: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTechConditionsObjectsTopLeftChanged(Sender: TObject);
procedure sgENTechConditionsObjectsDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENTechConditionsObjectsShow : TfrmENTechConditionsObjectsShow;
 // ENTechConditionsObjectsObj: ENTechConditionsObjects;
 // ENTechConditionsObjectsFilterObj: ENTechConditionsObjectsFilter;
  
  
implementation

uses Main, EditENTechConditionsObjects, EditENTechConditionsObjectsFilter, ComObj;


{$R *.dfm}

var
  //frmENTechConditionsObjectsShow : TfrmENTechConditionsObjectsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTechConditionsObjectsHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер ТУ'
          ,'Дата видачі ТУ'
          ,'Замовник'
          ,'Об’єкт'
          ,'Адреса об’єкту'
          ,'Потужність за договором'
          ,'Потужність існуюча'
        );
   

procedure TfrmENTechConditionsObjectsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTechConditionsObjectsShow:=nil;
    inherited;
  end;


procedure TfrmENTechConditionsObjectsShow.FormShow(Sender: TObject);
var
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
  i: Integer;
  ENTechConditionsObjectsList: ENTechConditionsObjectsShortList;
begin
  SetGridHeaders(ENTechConditionsObjectsHeaders, sgENTechConditionsObjects.ColumnHeaders);
  ColCount:=100;
  TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTechConditionsObjectsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTechConditionsObjectsList := TempENTechConditionsObjects.getScrollableFilteredList(ENTechConditionsObjectsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTechConditionsObjectsList.list);

  if LastCount > -1 then
     sgENTechConditionsObjects.RowCount:=LastCount+2
  else
     sgENTechConditionsObjects.RowCount:=2;

   with sgENTechConditionsObjects do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTechConditionsObjectsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTechConditionsObjectsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTechConditionsObjectsList.list[i].numberGen;
        if ENTechConditionsObjectsList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTechConditionsObjectsList.list[i].dateGen);
        Cells[3,i+1] := ENTechConditionsObjectsList.list[i].customer;
        Cells[4,i+1] := ENTechConditionsObjectsList.list[i].building;
        Cells[5,i+1] := ENTechConditionsObjectsList.list[i].address;
        if ENTechConditionsObjectsList.list[i].tyServicesPower = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTechConditionsObjectsList.list[i].tyServicesPower.DecimalString;
        if ENTechConditionsObjectsList.list[i].tyCurrentPower = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENTechConditionsObjectsList.list[i].tyCurrentPower.DecimalString;
        LastRow:=i+1;
        sgENTechConditionsObjects.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTechConditionsObjects.Row:=1;
end;

procedure TfrmENTechConditionsObjectsShow.sgENTechConditionsObjectsTopLeftChanged(Sender: TObject);
var
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
  i,CurrentRow: Integer;
  ENTechConditionsObjectsList: ENTechConditionsObjectsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTechConditionsObjects.TopRow + sgENTechConditionsObjects.VisibleRowCount) = ColCount
  then
    begin
      TempENTechConditionsObjects :=  HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
      CurrentRow:=sgENTechConditionsObjects.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTechConditionsObjectsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTechConditionsObjectsList := TempENTechConditionsObjects.getScrollableFilteredList(ENTechConditionsObjectsFilter(FilterObject),ColCount-1, 100);



  sgENTechConditionsObjects.RowCount:=sgENTechConditionsObjects.RowCount+100;
  LastCount:=High(ENTechConditionsObjectsList.list);
  with sgENTechConditionsObjects do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTechConditionsObjectsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTechConditionsObjectsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTechConditionsObjectsList.list[i].numberGen;
        if ENTechConditionsObjectsList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENTechConditionsObjectsList.list[i].dateGen);
        Cells[3,i+CurrentRow] := ENTechConditionsObjectsList.list[i].customer;
        Cells[4,i+CurrentRow] := ENTechConditionsObjectsList.list[i].building;
        Cells[5,i+CurrentRow] := ENTechConditionsObjectsList.list[i].address;
        if ENTechConditionsObjectsList.list[i].tyServicesPower = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENTechConditionsObjectsList.list[i].tyServicesPower.DecimalString;
        if ENTechConditionsObjectsList.list[i].tyCurrentPower = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENTechConditionsObjectsList.list[i].tyCurrentPower.DecimalString;
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTechConditionsObjects.Row:=CurrentRow-5;
   sgENTechConditionsObjects.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTechConditionsObjectsShow.sgENTechConditionsObjectsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTechConditionsObjects,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTechConditionsObjectsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTechConditionsObjects.RowCount-1 do
   for j:=0 to sgENTechConditionsObjects.ColCount-1 do
     sgENTechConditionsObjects.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTechConditionsObjectsShow.actViewExecute(Sender: TObject);
Var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin
 TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
   try
     ENTechConditionsObjectsObj := TempENTechConditionsObjects.getObject(StrToInt(sgENTechConditionsObjects.Cells[0,sgENTechConditionsObjects.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTechConditionsObjectsEdit:=TfrmENTechConditionsObjectsEdit.Create(Application, dsView);
  try
    frmENTechConditionsObjectsEdit.ShowModal;
  finally
    frmENTechConditionsObjectsEdit.Free;
    frmENTechConditionsObjectsEdit:=nil;
  end;
end;

procedure TfrmENTechConditionsObjectsShow.actEditExecute(Sender: TObject);
Var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin
 TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
   try
     ENTechConditionsObjectsObj := TempENTechConditionsObjects.getObject(StrToInt(sgENTechConditionsObjects.Cells[0,sgENTechConditionsObjects.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTechConditionsObjectsEdit:=TfrmENTechConditionsObjectsEdit.Create(Application, dsEdit);
  try
    if frmENTechConditionsObjectsEdit.ShowModal= mrOk then
      begin
        //TempENTechConditionsObjects.save(ENTechConditionsObjectsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTechConditionsObjectsEdit.Free;
    frmENTechConditionsObjectsEdit:=nil;
  end;
end;

procedure TfrmENTechConditionsObjectsShow.actDeleteExecute(Sender: TObject);
Var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTechConditionsObjects.Cells[0,sgENTechConditionsObjects.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Технічні умови) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTechConditionsObjects.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTechConditionsObjectsShow.actInsertExecute(Sender: TObject);
Var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin
  TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
  ENTechConditionsObjectsObj:=ENTechConditionsObjects.Create;

   //ENTechConditionsObjectsObj.dateGen:= TXSDate.Create;
   //ENTechConditionsObjectsObj.tyServicesPower:= TXSDecimal.Create;


  try
    frmENTechConditionsObjectsEdit:=TfrmENTechConditionsObjectsEdit.Create(Application, dsInsert);
    
    try
      if frmENTechConditionsObjectsEdit.ShowModal = mrOk then
      begin
        if ENTechConditionsObjectsObj<>nil then
            //TempENTechConditionsObjects.add(ENTechConditionsObjectsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTechConditionsObjectsEdit.Free;
      frmENTechConditionsObjectsEdit:=nil;
    end;
  finally
    ENTechConditionsObjectsObj.Free;
  end;
end;

procedure TfrmENTechConditionsObjectsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTechConditionsObjectsShow.actFilterExecute(Sender: TObject);
begin
frmENTechConditionsObjectsFilterEdit:=TfrmENTechConditionsObjectsFilterEdit.Create(Application, dsInsert);
  try
    ENTechConditionsObjectsFilterObj := ENTechConditionsObjectsFilter.Create;
    SetNullIntProps(ENTechConditionsObjectsFilterObj);
    SetNullXSProps(ENTechConditionsObjectsFilterObj);

    if frmENTechConditionsObjectsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTechConditionsObjectsFilter.Create;
      FilterObject := ENTechConditionsObjectsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTechConditionsObjectsFilterEdit.Free;
    frmENTechConditionsObjectsFilterEdit:=nil;
  end;
end;

procedure TfrmENTechConditionsObjectsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENTechConditionsObjectsShow.btnExportExcelClick(
  Sender: TObject);
var
        ExcelApp : OleVariant;
        i, j, lastCount : Integer;
        TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
        ENTechConditionsObjectsList: ENTechConditionsObjectsShortList;
        filterObj : ENTechConditionsObjectsFilter;
  begin
  inherited;
try
  filterObj := ENTechConditionsObjectsFilter(FilterObject);

  if filterObj = nil then
  begin
    filterObj := ENTechConditionsObjectsFilter.Create;
    SetNullIntProps(filterObj);
    SetNullXSProps(filterObj);
  end;

  TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
  ENTechConditionsObjectsList := TempENTechConditionsObjects.getScrollableFilteredList(filterObj,0,-1);


  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Add();

        ExcelApp.Cells[1,1].Value := 'Код';
        ExcelApp.Cells[1,2].Value := 'Номер ТУ';
        ExcelApp.Cells[1,3].Value := 'Дата видачі ТУ';
        ExcelApp.Cells[1,4].Value := 'Замовник';
        ExcelApp.Cells[1,5].Value := 'Об''єкт';
        ExcelApp.Cells[1,6].Value := 'Адреса об''єкта';
        ExcelApp.Cells[1,7].Value := 'Потужність за договором';
        ExcelApp.Cells[1,8].Value := 'Потужність існуюча';

        ExcelApp.Cells[1,1].ColumnWidth := 1;  {Ширина колонок}
        ExcelApp.Cells[1,2].ColumnWidth := 30;
        ExcelApp.Cells[1,3].ColumnWidth := 30;
        ExcelApp.Cells[1,4].ColumnWidth := 30;
        ExcelApp.Cells[1,5].ColumnWidth := 50;
        ExcelApp.Cells[1,6].ColumnWidth := 50;
        ExcelApp.Cells[1,7].ColumnWidth := 20;
        ExcelApp.Cells[1,8].ColumnWidth := 20;

        lastCount := 8;

        // 1.1 - Наводим красоту перед выполнением всего
        For i := 1 to lastCount do
        begin
          ExcelApp.Cells[1,i].Borders.Item[1].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[1].Weight := 2;
            ExcelApp.Cells[1,i].Borders.Item[2].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[2].Weight := 2;
            ExcelApp.Cells[1,i].Borders.Item[3].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[3].Weight := 2;
            ExcelApp.Cells[1,i].Borders.Item[4].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[4].Weight := 2;
            ExcelApp.Cells[1,i].Font.Bold := True;
        end;

        lastCount := ENTechConditionsObjectsList.totalCount;

        For i := 0 to lastCount-1 do
        begin
          if ENTechConditionsObjectsList.list[i].code <> Low(Integer) then
            ExcelApp.Cells[i+2,1] := IntToStr(ENTechConditionsObjectsList.list[i].code)
          else
            ExcelApp.Cells[i+2,1] := '';
          ExcelApp.Cells[i+2,2] := ENTechConditionsObjectsList.list[i].numberGen;
          if ENTechConditionsObjectsList.list[i].dateGen = nil then
            ExcelApp.Cells[i+2,3] := ''
          else
            ExcelApp.Cells[i+2,3] := XSDate2String(ENTechConditionsObjectsList.list[i].dateGen);
          ExcelApp.Cells[i+2,4] := ENTechConditionsObjectsList.list[i].customer;
          ExcelApp.Cells[i+2,5] := ENTechConditionsObjectsList.list[i].building;
          ExcelApp.Cells[i+2,6] := ENTechConditionsObjectsList.list[i].address;
          if ENTechConditionsObjectsList.list[i].tyServicesPower = nil then
            ExcelApp.Cells[i+2,7] := ''
          else
            ExcelApp.Cells[i+2,7] := ENTechConditionsObjectsList.list[i].tyServicesPower.DecimalString;
          if ENTechConditionsObjectsList.list[i].tyCurrentPower = nil then
            ExcelApp.Cells[i+2,8] := ''
          else
            ExcelApp.Cells[i+2,8] := ENTechConditionsObjectsList.list[i].tyCurrentPower.DecimalString;


           ExcelApp.Cells[i+2,1].WrapText := True;
           ExcelApp.Cells[i+2,2].WrapText := True;
           ExcelApp.Cells[i+2,3].WrapText := True;
           ExcelApp.Cells[i+2,4].WrapText := True;
           ExcelApp.Cells[i+2,5].WrapText := True;
           ExcelApp.Cells[i+2,6].WrapText := True;
           ExcelApp.Cells[i+2,7].WrapText := True;
           ExcelApp.Cells[i+2,8].WrapText := True;

           for j := 1 to 4 do
           begin
              ExcelApp.Cells[i+2,1].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,2].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,3].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,4].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,5].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,6].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,7].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,8].Borders.Item[j].Weight := 2;
           end;

           ExcelApp.Cells[i+2,2].NumberFormat := '@'; {Формат ячейки - текст}
           ExcelApp.Cells[i+2,2].HorizontalAlignment := 4; {Выравнивание текста}
        end;


  ExcelApp.Visible := True;
finally
  if ExcelApp.Visible <> True then ExcelApp.Quit;
end;
end;

end.