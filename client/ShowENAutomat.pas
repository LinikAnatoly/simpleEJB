
unit ShowENAutomat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAutomatController, AdvObj ;


type
  TfrmENAutomatShow = class(TChildForm)  
  HTTPRIOENAutomat: THTTPRIO;
    ImageList1: TImageList;
    sgENAutomat: TAdvStringGrid;
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
procedure sgENAutomatTopLeftChanged(Sender: TObject);
procedure sgENAutomatDblClick(Sender: TObject);
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

var
 frmENAutomatShow : TfrmENAutomatShow;
 // ENAutomatObj: ENAutomat;
 // ENAutomatFilterObj: ENAutomatFilter;
  
  
implementation

uses Main, EditENAutomat, EditENAutomatFilter;


{$R *.dfm}

var
  //frmENAutomatShow : TfrmENAutomatShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAutomatHeaders: array [1..6] of String =
        ('Код'
        ,'Автоматический выключатель'
        ,'Диспетчерское название'
        ,'Ток отсечки'
        ,'Ток теплового расцепителя'
        ,'Підрозділ об`єкту'
        );
   

procedure TfrmENAutomatShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAutomatShow:=nil;
    inherited;
  end;


procedure TfrmENAutomatShow.FormShow(Sender: TObject);
var
  TempENAutomat: ENAutomatControllerSoapPort;
  i: Integer;
  ENAutomatList: ENAutomatShortList;
  begin
  SetGridHeaders(ENAutomatHeaders, sgENAutomat.ColumnHeaders);
  ColCount:=100;
  TempENAutomat :=  HTTPRIOENAutomat as ENAutomatControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAutomatFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutomatList := TempENAutomat.getScrollableFilteredList(
    ENAutomatFilter(FilterObject),0,ColCount);

  LastCount:=High(ENAutomatList.list);

  if LastCount > -1 then
     sgENAutomat.RowCount:=LastCount+2
  else
     sgENAutomat.RowCount:=2;

  with sgENAutomat do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutomatList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENAutomatList.list[i].code)
        else //Код Автоматического выключателя
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENAutomatList.list[i].materialRefName; //Автоматический выключатель из Нормативных материалов
        Cells[2, i + 1] := ENAutomatList.list[i].name; //Диспетчерское название
        if (ENAutomatList.list[i].markCurrent <> nil) then
          Cells[3, i + 1] := ENAutomatList.list[i].markCurrent.decimalString
        else //Ток отсечки
          Cells[3, i + 1] := '';
        if (ENAutomatList.list[i].thermalSplitterCurrent <> nil) then
          Cells[4, i + 1] :=
            ENAutomatList.list[i].thermalSplitterCurrent.decimalString
        else //Ток теплового расцепителя
          Cells[4, i + 1] := '';

        Cells[5, i + 1] := ENAutomatList.list[i].renName; //подразделение елемента

        LastRow := i + 1;
        sgENAutomat.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAutomat.Row:=1;
end;

procedure TfrmENAutomatShow.sgENAutomatTopLeftChanged(Sender: TObject);
var
  TempENAutomat: ENAutomatControllerSoapPort;
  i,CurrentRow: Integer;
  ENAutomatList: ENAutomatShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAutomat.TopRow + sgENAutomat.VisibleRowCount) = ColCount
  then
    begin
      TempENAutomat :=  HTTPRIOENAutomat as ENAutomatControllerSoapPort;
      CurrentRow:=sgENAutomat.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAutomatFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutomatList := TempENAutomat.getScrollableFilteredList(ENAutomatFilter(FilterObject),ColCount-1, 100);



  sgENAutomat.RowCount:=sgENAutomat.RowCount+100;
  LastCount:=High(ENAutomatList.list);
  with sgENAutomat do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutomatList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAutomatList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1, i + CurrentRow] := ENAutomatList.list[i].materialRefName; //Автоматический выключатель из Нормативных материалов
        Cells[2, i + CurrentRow] := ENAutomatList.list[i].name; //Диспетчерское название
        if (ENAutomatList.list[i].markCurrent <> nil) then
          Cells[3, i + CurrentRow] := ENAutomatList.list[i].markCurrent.decimalString
        else //Ток отсечки
          Cells[3, i + CurrentRow] := '';
        if (ENAutomatList.list[i].thermalSplitterCurrent <> nil) then
          Cells[4, i + CurrentRow] :=
            ENAutomatList.list[i].thermalSplitterCurrent.decimalString
        else //Ток теплового расцепителя
          Cells[4, i + CurrentRow] := '';

        Cells[5, i + CurrentRow] := ENAutomatList.list[i].renName; //подразделение елемента


          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAutomat.Row:=CurrentRow-5;
   sgENAutomat.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAutomatShow.sgENAutomatDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAutomat,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAutomatShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAutomat.RowCount-1 do
   for j:=0 to sgENAutomat.ColCount-1 do
     sgENAutomat.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAutomatShow.actViewExecute(Sender: TObject);
Var TempENAutomat: ENAutomatControllerSoapPort;
begin
 TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
   try
     ENAutomatObj := TempENAutomat.getObject(StrToInt(sgENAutomat.Cells[0,sgENAutomat.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutomatEdit:=TfrmENAutomatEdit.Create(Application, dsView);
  try
    frmENAutomatEdit.ShowModal;
  finally
    frmENAutomatEdit.Free;
    frmENAutomatEdit:=nil;
  end;
end;

procedure TfrmENAutomatShow.actEditExecute(Sender: TObject);
Var TempENAutomat: ENAutomatControllerSoapPort;
begin
 TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
   try
     ENAutomatObj := TempENAutomat.getObject(StrToInt(sgENAutomat.Cells[0,sgENAutomat.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutomatEdit:=TfrmENAutomatEdit.Create(Application, dsEdit);
  try
    if frmENAutomatEdit.ShowModal= mrOk then
      begin
        //TempENAutomat.save(ENAutomatObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAutomatEdit.Free;
    frmENAutomatEdit:=nil;
  end;
end;

procedure TfrmENAutomatShow.actDeleteExecute(Sender: TObject);
Var TempENAutomat: ENAutomatControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAutomat.Cells[0,sgENAutomat.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Автоматы) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAutomat.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAutomatShow.actInsertExecute(Sender: TObject);
Var TempENAutomat: ENAutomatControllerSoapPort;
begin
  TempENAutomat := HTTPRIOENAutomat as ENAutomatControllerSoapPort;
  ENAutomatObj:=ENAutomat.Create;

   //ENAutomatObj.markCurrent:= TXSDecimal.Create;
   //ENAutomatObj.thermalSplitterCurrent:= TXSDecimal.Create;


  try
    frmENAutomatEdit:=TfrmENAutomatEdit.Create(Application, dsInsert);
    try
      if frmENAutomatEdit.ShowModal = mrOk then
      begin
        if ENAutomatObj<>nil then
            //TempENAutomat.add(ENAutomatObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAutomatEdit.Free;
      frmENAutomatEdit:=nil;
    end;
  finally
    ENAutomatObj.Free;
  end;
end;

procedure TfrmENAutomatShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAutomatShow.actFilterExecute(Sender: TObject);
begin
frmENAutomatFilterEdit:=TfrmENAutomatFilterEdit.Create(Application, dsInsert);
  try
    ENAutomatFilterObj := ENAutomatFilter.Create;
    SetNullIntProps(ENAutomatFilterObj);
    SetNullXSProps(ENAutomatFilterObj);

    if frmENAutomatFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAutomatFilter.Create;
      FilterObject := ENAutomatFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAutomatFilterEdit.Free;
    frmENAutomatFilterEdit:=nil;
  end;
end;

procedure TfrmENAutomatShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
