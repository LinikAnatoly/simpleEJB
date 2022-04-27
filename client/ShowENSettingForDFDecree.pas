
unit ShowENSettingForDFDecree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSettingForDFDecreeController, AdvObj ;


type
    TfrmENSettingForDFDecreeShow = class(TChildForm)  
    HTTPRIOENSettingForDFDecree: THTTPRIO;
    ImageList1: TImageList;
    sgENSettingForDFDecree: TAdvStringGrid;
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

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENSettingForDFDecreeTopLeftChanged(Sender: TObject);
    procedure sgENSettingForDFDecreeDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENSettingForDFDecreeShow : TfrmENSettingForDFDecreeShow;
 // ENSettingForDFDecreeObj: ENSettingForDFDecree;
 // ENSettingForDFDecreeFilterObj: ENSettingForDFDecreeFilter;
  
  
implementation

uses Main, EditENSettingForDFDecree, EditENSettingForDFDecreeFilter;


{$R *.dfm}

var
  //frmENSettingForDFDecreeShow : TfrmENSettingForDFDecreeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSettingForDFDecreeHeaders: array [1..17] of String =
        ( 'Код'
          ,'Шаблон для підрозділу '//,'Типы документов dfDoc'
          ,'Типы документов dfDoc Название'
          ,'Каталог наказів і розпоряджень(Класифікація за каталогом)'
          ,'Каталог наказів і розпоряджень(Класифікація за каталогом) название'
          ,'Префікс для документів код'
          ,'Префікс для документів Назва'
          ,'Табельний номер особи, яка підписує документ'
          ,'П.І.Б. особи, яка підписує документ'
          ,'Посада особи, яка підписує документ'
          ,'Табельний номер особи, яка ініціює документ'
          ,'П.І.Б. особи, яка ініціює документ'
          ,'Служба особи, яка ініціює документ'
          ,'Код служби особи, яка ініціює документ'
          ,'Табельний номер уповноваженої особи'
          ,'П.І.Б. уповноваженої особи'
          ,'Посада уповноваженої особи'
        );
   

procedure TfrmENSettingForDFDecreeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSettingForDFDecreeShow:=nil;
  inherited;
end;


procedure TfrmENSettingForDFDecreeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSettingForDFDecreeShow.FormShow(Sender: TObject);
var
  TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
  i: Integer;
  ENSettingForDFDecreeList: ENSettingForDFDecreeShortList;
begin
  SetGridHeaders(ENSettingForDFDecreeHeaders, sgENSettingForDFDecree.ColumnHeaders);
  ColCount:=100;
  TempENSettingForDFDecree :=  HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSettingForDFDecreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSettingForDFDecreeList := TempENSettingForDFDecree.getScrollableFilteredList(ENSettingForDFDecreeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSettingForDFDecreeList.list);

  if LastCount > -1 then
     sgENSettingForDFDecree.RowCount:=LastCount+2
  else
     sgENSettingForDFDecree.RowCount:=2;

   with sgENSettingForDFDecree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSettingForDFDecreeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENSettingForDFDecreeList.list[i].departmentRefShortName;

//        if ENSettingForDFDecreeList.list[i].dfDocTypeCode = Low(Integer) then
//          Cells[1,i+1] := ''
//        else
//          Cells[1,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].dfDocTypeCode);
        Cells[2,i+1] := ENSettingForDFDecreeList.list[i].dfDocTypeName;
        if ENSettingForDFDecreeList.list[i].catalogCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].catalogCode);
        Cells[4,i+1] := ENSettingForDFDecreeList.list[i].catalogName;
        if ENSettingForDFDecreeList.list[i].dfDocPrefixCode = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].dfDocPrefixCode);
        Cells[6,i+1] := ENSettingForDFDecreeList.list[i].dfDocPrefixName;
        Cells[7,i+1] := ENSettingForDFDecreeList.list[i].prefixSignerTabN;
        Cells[8,i+1] := ENSettingForDFDecreeList.list[i].prefixSignerFio;
        Cells[9,i+1] := ENSettingForDFDecreeList.list[i].prefixSignerPostInfo;
        Cells[10,i+1] := ENSettingForDFDecreeList.list[i].initiatorTabn;
        Cells[11,i+1] := ENSettingForDFDecreeList.list[i].initiatorFio;
        Cells[12,i+1] := ENSettingForDFDecreeList.list[i].initiatorPodrName;
        if ENSettingForDFDecreeList.list[i].initiatorPodrCode = Low(Integer) then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := IntToStr(ENSettingForDFDecreeList.list[i].initiatorPodrCode);
        Cells[14,i+1] := ENSettingForDFDecreeList.list[i].designatedTabn;
        Cells[15,i+1] := ENSettingForDFDecreeList.list[i].designatedFio;
        Cells[16,i+1] := ENSettingForDFDecreeList.list[i].designatedpostInfo;
        LastRow:=i+1;
        sgENSettingForDFDecree.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSettingForDFDecree.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSettingForDFDecree.RowCount > selectedRow then
      sgENSettingForDFDecree.Row := selectedRow
    else
      sgENSettingForDFDecree.Row := sgENSettingForDFDecree.RowCount - 1;
    end
    else
      sgENSettingForDFDecree.Row:=1;   
end;


procedure TfrmENSettingForDFDecreeShow.sgENSettingForDFDecreeTopLeftChanged(Sender: TObject);
var
  TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSettingForDFDecreeList: ENSettingForDFDecreeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSettingForDFDecree.TopRow + sgENSettingForDFDecree.VisibleRowCount) = ColCount
  then
    begin
      TempENSettingForDFDecree :=  HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;
      CurrentRow:=sgENSettingForDFDecree.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSettingForDFDecreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSettingForDFDecreeList := TempENSettingForDFDecree.getScrollableFilteredList(ENSettingForDFDecreeFilter(FilterObject),ColCount-1, 100);


  sgENSettingForDFDecree.RowCount:=sgENSettingForDFDecree.RowCount+100;
  LastCount:=High(ENSettingForDFDecreeList.list);
  with sgENSettingForDFDecree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSettingForDFDecreeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSettingForDFDecreeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENSettingForDFDecreeList.list[i].departmentRefShortName;

//        if ENSettingForDFDecreeList.list[i].dfDocTypeCode = Low(Integer) then
//          Cells[1,i+CurrentRow] := ''
//        else
//          Cells[1,i+CurrentRow] := IntToStr(ENSettingForDFDecreeList.list[i].dfDocTypeCode);
        Cells[2,i+CurrentRow] := ENSettingForDFDecreeList.list[i].dfDocTypeName;
        if ENSettingForDFDecreeList.list[i].catalogCode = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENSettingForDFDecreeList.list[i].catalogCode);
        Cells[4,i+CurrentRow] := ENSettingForDFDecreeList.list[i].catalogName;
        if ENSettingForDFDecreeList.list[i].dfDocPrefixCode = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(ENSettingForDFDecreeList.list[i].dfDocPrefixCode);
        Cells[6,i+CurrentRow] := ENSettingForDFDecreeList.list[i].dfDocPrefixName;
        Cells[7,i+CurrentRow] := ENSettingForDFDecreeList.list[i].prefixSignerTabN;
        Cells[8,i+CurrentRow] := ENSettingForDFDecreeList.list[i].prefixSignerFio;
        Cells[9,i+CurrentRow] := ENSettingForDFDecreeList.list[i].prefixSignerPostInfo;
        Cells[10,i+CurrentRow] := ENSettingForDFDecreeList.list[i].initiatorTabn;
        Cells[11,i+CurrentRow] := ENSettingForDFDecreeList.list[i].initiatorFio;
        Cells[12,i+CurrentRow] := ENSettingForDFDecreeList.list[i].initiatorPodrName;
        if ENSettingForDFDecreeList.list[i].initiatorPodrCode = Low(Integer) then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := IntToStr(ENSettingForDFDecreeList.list[i].initiatorPodrCode);
        Cells[14,i+CurrentRow] := ENSettingForDFDecreeList.list[i].designatedTabn;
        Cells[15,i+CurrentRow] := ENSettingForDFDecreeList.list[i].designatedFio;
        Cells[16,i+CurrentRow] := ENSettingForDFDecreeList.list[i].designatedpostInfo;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSettingForDFDecree.Row:=CurrentRow-5;
   sgENSettingForDFDecree.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSettingForDFDecreeShow.sgENSettingForDFDecreeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSettingForDFDecree,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSettingForDFDecreeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSettingForDFDecree.RowCount-1 do
   for j:=0 to sgENSettingForDFDecree.ColCount-1 do
     sgENSettingForDFDecree.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSettingForDFDecreeShow.actViewExecute(Sender: TObject);
var 
  TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
begin
  TempENSettingForDFDecree := HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;
  try
    ENSettingForDFDecreeObj := TempENSettingForDFDecree.getObject(StrToInt(sgENSettingForDFDecree.Cells[0,sgENSettingForDFDecree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSettingForDFDecree.Row;
  frmENSettingForDFDecreeEdit:=TfrmENSettingForDFDecreeEdit.Create(Application, dsView);
  
  try
    frmENSettingForDFDecreeEdit.ShowModal;
  finally
    frmENSettingForDFDecreeEdit.Free;
    frmENSettingForDFDecreeEdit:=nil;
  end;

  if sgENSettingForDFDecree.RowCount > selectedRow then
    sgENSettingForDFDecree.Row := selectedRow
  else
    sgENSettingForDFDecree.Row := sgENSettingForDFDecree.RowCount - 1;
  
end;


procedure TfrmENSettingForDFDecreeShow.actEditExecute(Sender: TObject);
var 
  TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
begin
  TempENSettingForDFDecree := HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;
  try
    ENSettingForDFDecreeObj := TempENSettingForDFDecree.getObject(StrToInt(sgENSettingForDFDecree.Cells[0,sgENSettingForDFDecree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSettingForDFDecree.Row;
  frmENSettingForDFDecreeEdit:=TfrmENSettingForDFDecreeEdit.Create(Application, dsEdit);
  
  try
    if frmENSettingForDFDecreeEdit.ShowModal= mrOk then
      begin
        //TempENSettingForDFDecree.save(ENSettingForDFDecreeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSettingForDFDecreeEdit.Free;
    frmENSettingForDFDecreeEdit:=nil;
  end;

  if sgENSettingForDFDecree.RowCount > selectedRow then
    sgENSettingForDFDecree.Row := selectedRow
  else
    sgENSettingForDFDecree.Row := sgENSettingForDFDecree.RowCount - 1;
  
end;


procedure TfrmENSettingForDFDecreeShow.actDeleteExecute(Sender: TObject);
Var TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSettingForDFDecree := HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSettingForDFDecree.Cells[0,sgENSettingForDFDecree.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (настройка значений по умолчанию, с разбивкой по типам док и ресам) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSettingForDFDecree.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSettingForDFDecreeShow.actInsertExecute(Sender: TObject);
// Var TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort; 
begin
  // TempENSettingForDFDecree := HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSettingForDFDecreeObj:=ENSettingForDFDecree.Create;
  SetNullIntProps(ENSettingForDFDecreeObj);
  SetNullXSProps(ENSettingForDFDecreeObj);



  try
    frmENSettingForDFDecreeEdit:=TfrmENSettingForDFDecreeEdit.Create(Application, dsInsert);
    try
      if frmENSettingForDFDecreeEdit.ShowModal = mrOk then
      begin
        if ENSettingForDFDecreeObj<>nil then
            //TempENSettingForDFDecree.add(ENSettingForDFDecreeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSettingForDFDecreeEdit.Free;
      frmENSettingForDFDecreeEdit:=nil;
    end;
  finally
    ENSettingForDFDecreeObj.Free;
  end;
end;


procedure TfrmENSettingForDFDecreeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSettingForDFDecreeShow.actFilterExecute(Sender: TObject);
begin
{frmENSettingForDFDecreeFilterEdit:=TfrmENSettingForDFDecreeFilterEdit.Create(Application, dsInsert);
  try
    ENSettingForDFDecreeFilterObj := ENSettingForDFDecreeFilter.Create;
    SetNullIntProps(ENSettingForDFDecreeFilterObj);
    SetNullXSProps(ENSettingForDFDecreeFilterObj);

    if frmENSettingForDFDecreeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSettingForDFDecreeFilter.Create;
      FilterObject := ENSettingForDFDecreeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSettingForDFDecreeFilterEdit.Free;
    frmENSettingForDFDecreeFilterEdit:=nil;
  end;}
end;


procedure TfrmENSettingForDFDecreeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.