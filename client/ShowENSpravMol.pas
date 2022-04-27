
unit ShowENSpravMol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSpravMolController, AdvObj ;


type
  TfrmENSpravMolShow = class(TChildForm)  
  HTTPRIOENSpravMol: THTTPRIO;
    ImageList1: TImageList;
    sgENSpravMol: TAdvStringGrid;
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
procedure sgENSpravMolTopLeftChanged(Sender: TObject);
procedure sgENSpravMolDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENSpravMolObj: ENSpravMol;
 // ENSpravMolFilterObj: ENSpravMolFilter;
  
  
implementation

uses Main, EditENSpravMol, EditENSpravMolFilter;


{$R *.dfm}

var
  frmENSpravMolShow : TfrmENSpravMolShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSpravMolHeaders: array [1..4] of String =
        ( ' Код'
          ,' Код МВО'
          ,' ПІБ/посада МВО '
          ,' Підрозділ '
        );
   

procedure TfrmENSpravMolShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSpravMolShow:=nil;
    inherited;
  end;


procedure TfrmENSpravMolShow.FormShow(Sender: TObject);
var
  TempENSpravMol: ENSpravMolControllerSoapPort;
  i: Integer;
  ENSpravMolList: ENSpravMolShortList;
  begin
  SetGridHeaders(ENSpravMolHeaders, sgENSpravMol.ColumnHeaders);
  ColCount:=100;
  TempENSpravMol :=  HTTPRIOENSpravMol as ENSpravMolControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSpravMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSpravMolList := TempENSpravMol.getScrollableFilteredList(ENSpravMolFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSpravMolList.list);

  if LastCount > -1 then
     sgENSpravMol.RowCount:=LastCount+2
  else
     sgENSpravMol.RowCount:=2;

   with sgENSpravMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSpravMolList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSpravMolList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSpravMolList.list[i].molkod;
        Cells[2,i+1] := ENSpravMolList.list[i].molname;
        Cells[3,i+1] := ENSpravMolList.list[i].departmentShortName;
        LastRow:=i+1;
        sgENSpravMol.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSpravMol.Row:=1;
end;

procedure TfrmENSpravMolShow.sgENSpravMolTopLeftChanged(Sender: TObject);
var
  TempENSpravMol: ENSpravMolControllerSoapPort;
  i,CurrentRow: Integer;
  ENSpravMolList: ENSpravMolShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSpravMol.TopRow + sgENSpravMol.VisibleRowCount) = ColCount
  then
    begin
      TempENSpravMol :=  HTTPRIOENSpravMol as ENSpravMolControllerSoapPort;
      CurrentRow:=sgENSpravMol.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSpravMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSpravMolList := TempENSpravMol.getScrollableFilteredList(ENSpravMolFilter(FilterObject),ColCount-1, 100);



  sgENSpravMol.RowCount:=sgENSpravMol.RowCount+100;
  LastCount:=High(ENSpravMolList.list);
  with sgENSpravMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSpravMolList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSpravMolList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSpravMolList.list[i].molkod;
        Cells[2,i+CurrentRow] := ENSpravMolList.list[i].molname;
        Cells[3,i+CurrentRow] := ENSpravMolList.list[i].departmentShortName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSpravMol.Row:=CurrentRow-5;
   sgENSpravMol.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSpravMolShow.sgENSpravMolDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSpravMol,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSpravMolShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSpravMol.RowCount-1 do
   for j:=0 to sgENSpravMol.ColCount-1 do
     sgENSpravMol.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSpravMolShow.actViewExecute(Sender: TObject);
Var TempENSpravMol: ENSpravMolControllerSoapPort;
begin
 TempENSpravMol := HTTPRIOENSpravMol as ENSpravMolControllerSoapPort;
   try
     ENSpravMolObj := TempENSpravMol.getObject(StrToInt(sgENSpravMol.Cells[0,sgENSpravMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSpravMolEdit:=TfrmENSpravMolEdit.Create(Application, dsView);
  try
    frmENSpravMolEdit.ShowModal;
  finally
    frmENSpravMolEdit.Free;
    frmENSpravMolEdit:=nil;
  end;
end;

procedure TfrmENSpravMolShow.actEditExecute(Sender: TObject);
Var TempENSpravMol: ENSpravMolControllerSoapPort;
begin
 TempENSpravMol := HTTPRIOENSpravMol as ENSpravMolControllerSoapPort;
   try
     ENSpravMolObj := TempENSpravMol.getObject(StrToInt(sgENSpravMol.Cells[0,sgENSpravMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSpravMolEdit:=TfrmENSpravMolEdit.Create(Application, dsEdit);
  try
    if frmENSpravMolEdit.ShowModal= mrOk then
      begin
        //TempENSpravMol.save(ENSpravMolObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSpravMolEdit.Free;
    frmENSpravMolEdit:=nil;
  end;
end;

procedure TfrmENSpravMolShow.actDeleteExecute(Sender: TObject);
Var TempENSpravMol: ENSpravMolControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSpravMol := HTTPRIOENSpravMol as ENSpravMolControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSpravMol.Cells[0,sgENSpravMol.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник МВО ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSpravMol.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSpravMolShow.actInsertExecute(Sender: TObject);
Var TempENSpravMol: ENSpravMolControllerSoapPort;
begin
  TempENSpravMol := HTTPRIOENSpravMol as ENSpravMolControllerSoapPort;
  ENSpravMolObj:=ENSpravMol.Create;



  try
    frmENSpravMolEdit:=TfrmENSpravMolEdit.Create(Application, dsInsert);
    try
      if frmENSpravMolEdit.ShowModal = mrOk then
      begin
        if ENSpravMolObj<>nil then
            //TempENSpravMol.add(ENSpravMolObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSpravMolEdit.Free;
      frmENSpravMolEdit:=nil;
    end;
  finally
    ENSpravMolObj.Free;
  end;
end;

procedure TfrmENSpravMolShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSpravMolShow.actFilterExecute(Sender: TObject);
begin
frmENSpravMolFilterEdit:=TfrmENSpravMolFilterEdit.Create(Application, dsInsert);
  try
    ENSpravMolFilterObj := ENSpravMolFilter.Create;
    SetNullIntProps(ENSpravMolFilterObj);
    SetNullXSProps(ENSpravMolFilterObj);

    if frmENSpravMolFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSpravMolFilter.Create;
      FilterObject := ENSpravMolFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSpravMolFilterEdit.Free;
    frmENSpravMolFilterEdit:=nil;
  end;
end;

procedure TfrmENSpravMolShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.