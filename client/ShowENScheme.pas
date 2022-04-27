
unit ShowENScheme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSchemeController, AdvObj ;

type
  TfrmENSchemeShow = class(TChildForm)  
  HTTPRIOENScheme: THTTPRIO;
    ImageList1: TImageList;
    sgENScheme: TAdvStringGrid;
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
    actOpen: TAction;
    tbOpen: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENSchemeTopLeftChanged(Sender: TObject);
//procedure sgENSchemeDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENSchemeShow : TfrmENSchemeShow;
 // ENSchemeObj: ENScheme;
 // ENSchemeFilterObj: ENSchemeFilter;

  
implementation

uses Main, EditENScheme, EditENSchemeFilter, ENElementController,
  ShowENSchemeAttachment, ENSchemeAttachmentController;


{$R *.dfm}

var
  //frmENSchemeShow : TfrmENSchemeShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSchemeHeaders: array [1..2] of String =
    ('Код',
    'Название перечня');

procedure TfrmENSchemeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSchemeShow := nil;
  inherited;
end;


procedure TfrmENSchemeShow.FormShow(Sender: TObject);
var
  TempENScheme: ENSchemeControllerSoapPort;
  i: Integer;
  ENSchemeList: ENSchemeShortList;
  begin
  SetGridHeaders(ENSchemeHeaders, sgENScheme.ColumnHeaders);
  ColCount:=100;
  TempENScheme :=  HTTPRIOENScheme as ENSchemeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSchemeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSchemeList := TempENScheme.getScrollableFilteredList(ENSchemeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSchemeList.list);

  if LastCount > -1 then
     sgENScheme.RowCount:=LastCount+2
  else
     sgENScheme.RowCount:=2;

   with sgENScheme do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSchemeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSchemeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSchemeList.list[i].name;
        LastRow:=i+1;
        sgENScheme.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENScheme.Row:=1;
end;

procedure TfrmENSchemeShow.sgENSchemeTopLeftChanged(Sender: TObject);
var
  TempENScheme: ENSchemeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSchemeList: ENSchemeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENScheme.TopRow + sgENScheme.VisibleRowCount) = ColCount
  then
    begin
      TempENScheme :=  HTTPRIOENScheme as ENSchemeControllerSoapPort;
      CurrentRow:=sgENScheme.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSchemeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSchemeList := TempENScheme.getScrollableFilteredList(ENSchemeFilter(FilterObject),ColCount-1, 100);



  sgENScheme.RowCount:=sgENScheme.RowCount+100;
  LastCount:=High(ENSchemeList.list);
  with sgENScheme do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSchemeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSchemeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSchemeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENScheme.Row:=CurrentRow-5;
   sgENScheme.RowCount:=LastRow+1;
  end;
end;

(*procedure TfrmENSchemeShow.sgENSchemeDblClick(Sender: TObject);
Var temp : Integer;
begin
  if FormMode = fmNormal then
    begin
      try
        temp:=StrToInt(GetReturnValue(sgENScheme,0));
      except
        on EConvertError do Exit;
      end;
      ModalResult:=mrOk;
    end
  else begin
    actViewExecute(Sender);
  end;
end;*)

procedure TfrmENSchemeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
  for i := 1 to sgENScheme.RowCount - 1 do
    for j := 0 to sgENScheme.ColCount - 1 do
      sgENScheme.Cells[j, i] := '';
  FormShow(Sender);
end;

procedure TfrmENSchemeShow.actViewExecute(Sender: TObject);
Var TempENScheme: ENSchemeControllerSoapPort;
begin
 TempENScheme := HTTPRIOENScheme as ENSchemeControllerSoapPort;
   try
     ENSchemeObj := TempENScheme.getObject(StrToInt(sgENScheme.Cells[0,sgENScheme.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSchemeEdit:=TfrmENSchemeEdit.Create(Application, dsView);
  try
    frmENSchemeEdit.ShowModal;
  finally
    frmENSchemeEdit.Free;
    frmENSchemeEdit:=nil;
  end;
end;

procedure TfrmENSchemeShow.actEditExecute(Sender: TObject);
Var TempENScheme: ENSchemeControllerSoapPort;
begin
 TempENScheme := HTTPRIOENScheme as ENSchemeControllerSoapPort;
   try
     ENSchemeObj := TempENScheme.getObject(StrToInt(sgENScheme.Cells[0,sgENScheme.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSchemeEdit:=TfrmENSchemeEdit.Create(Application, dsEdit);
  try
    if frmENSchemeEdit.ShowModal= mrOk then
      begin
        //TempENScheme.save(ENSchemeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSchemeEdit.Free;
    frmENSchemeEdit:=nil;
  end;
end;

procedure TfrmENSchemeShow.actDeleteExecute(Sender: TObject);
Var TempENScheme: ENSchemeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENScheme := HTTPRIOENScheme as ENSchemeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENScheme.Cells[0,sgENScheme.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Перечень схем для конкретного элемента) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENScheme.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSchemeShow.actInsertExecute(Sender: TObject);
Var TempENScheme: ENSchemeControllerSoapPort;
begin
  TempENScheme := HTTPRIOENScheme as ENSchemeControllerSoapPort;
  ENSchemeObj := ENScheme.Create;
  if FilterObject = nil then
    begin
      Application.MessageBox(PChar('Перечень не отфильтрован.'),
        PChar('Внимание!'), MB_ICONWARNING);
      Exit;
    end;
  if ENSchemeFilter(FilterObject).elementRef = nil then
    begin
      Application.MessageBox(PChar('Не определён элемент.'),
        PChar('Внимание!'), MB_ICONWARNING);
      Exit;
    end;
  if ENSchemeFilter(FilterObject).elementRef.code <> Low(Integer) then
    begin
      ENSchemeObj.elementRef := ENElementRef.Create;
      ENSchemeObj.elementRef.code :=
        ENSchemeFilter(FilterObject).elementRef.code;
    end
  else
    begin
      Application.MessageBox(PChar('Не определён код элемента.'),
        PChar('Внимание!'), MB_ICONWARNING);
      Exit;
    end;

  try
    frmENSchemeEdit := TfrmENSchemeEdit.Create(Application, dsInsert);
    try
      if frmENSchemeEdit.ShowModal = mrOk then
        begin
          if ENSchemeObj <> nil then
            UpdateGrid(Sender);
        end;
    finally
      frmENSchemeEdit.Free;
      frmENSchemeEdit := nil;
    end;
  finally
    ENSchemeObj.Free;
  end;
end;

procedure TfrmENSchemeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSchemeShow.actFilterExecute(Sender: TObject);
begin
{frmENSchemeFilterEdit:=TfrmENSchemeFilterEdit.Create(Application, dsInsert);
  try
    ENSchemeFilterObj := ENSchemeFilter.Create;
    SetNullIntProps(ENSchemeFilterObj);
    SetNullXSProps(ENSchemeFilterObj);

    if frmENSchemeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSchemeFilter.Create;
      FilterObject := ENSchemeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSchemeFilterEdit.Free;
    frmENSchemeFilterEdit:=nil;
  end;}
end;

procedure TfrmENSchemeShow.actNoFilterExecute(Sender: TObject);
begin
  {FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);}
end;

procedure TfrmENSchemeShow.actOpenExecute(Sender: TObject);
Var TempENScheme: ENSchemeControllerSoapPort;
  ENSchemeObj: ENScheme;
  ENSchemeAttachmentFilterObj: ENSchemeAttachmentFilter;
  fENSchemeAttachmentShow: TfrmENSchemeAttachmentShow;
begin //Развернуть указанный список схем выбранного элемента
  TempENScheme := HTTPRIOENScheme as ENSchemeControllerSoapPort;
  try
    ENSchemeObj := TempENScheme.getObject(StrToInt(
      sgENScheme.Cells[0,sgENScheme.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeAttachmentFilterObj := ENSchemeAttachmentFilter.Create;
  SetNullIntProps(ENSchemeAttachmentFilterObj);
  SetNullXSProps(ENSchemeAttachmentFilterObj);
  ENSchemeAttachmentFilterObj.schemeRef := ENSchemeRef.Create;
  ENSchemeAttachmentFilterObj.schemeRef.code := ENSchemeObj.code;

  fENSchemeAttachmentShow := TfrmENSchemeAttachmentShow.Create(
    Application, fmNormal, ENSchemeAttachmentFilterObj);
  try
    fENSchemeAttachmentShow.ShowModal;
  finally
    fENSchemeAttachmentShow.Free;
  end;

end;

end.
