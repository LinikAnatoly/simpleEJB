//Список Режимных замеров Понижающей подстанции 150 / 35 - 27 / 10 - 6 кВ
unit ShowENGauge150;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  ENGauge150Controller, AdvObj ;


type
  TfrmENGauge150Show = class(TChildForm)  
  HTTPRIOENGauge150: THTTPRIO;
    ImageList1: TImageList;
    sgENGauge150: TAdvStringGrid;
    ActionList1: TActionList;
    actViewENGauge150: TAction;
    actInsertENGauge150: TAction;
    actDeleteENGauge150: TAction;
    actEditENGauge150: TAction;
    actUpdateENGauge150: TAction;
    actFilterENGauge150: TAction;
    actNoFilterENGauge150: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    tlbENGauge150: TToolBar;
    btnViewENGauge150: TToolButton;
    btnInsertENGauge150: TToolButton;
    btnDeleteENGauge150: TToolButton;
    btnEditENGauge150: TToolButton;
    btnUpdateENGauge150: TToolButton;
    btnFilterENGauge150: TToolButton;
    btnNoFilterENGauge150: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENGauge150TopLeftChanged(Sender: TObject);
procedure sgENGauge150DblClick(Sender: TObject);
procedure actViewENGauge150Execute(Sender: TObject);
procedure actEditENGauge150Execute(Sender: TObject);
procedure actDeleteENGauge150Execute(Sender: TObject);
procedure actInsertENGauge150Execute(Sender: TObject);
procedure actUpdateENGauge150Execute(Sender: TObject);
procedure actFilterENGauge150Execute(Sender: TObject);
procedure actNoFilterENGauge150Execute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENGauge150Obj: ENGauge150;
 // ENGauge150FilterObj: ENGauge150Filter;
  
  
implementation

uses Main, EditENGauge150, EditENGauge150Filter, ENSubstation150Controller,
  ENSubst150PowerTransController;


{$R *.dfm}

var
  //frmENGauge150Show : TfrmENGauge150Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENGauge150Headers: array [1..6] of String =
        ( 'Код'
          ,'Название режимного замера'
          ,'Дата и время замера'
          ,'Режимный замер напряжения, кВ'
          ,'Режимный замер силы тока, А'
          ,'Потребление на собственные нужды, кВт'
        );
   

procedure TfrmENGauge150Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENGauge150Show:=nil;
    inherited;
  end;


procedure TfrmENGauge150Show.FormShow(Sender: TObject);
var
  TempENGauge150: ENGauge150ControllerSoapPort;
  i: Integer;
  ENGauge150List: ENGauge150ShortList;
  begin
  SetGridHeaders(ENGauge150Headers, sgENGauge150.ColumnHeaders);
  ColCount:=100;
  TempENGauge150 :=  HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENGauge150Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGauge150List := TempENGauge150.getScrollableFilteredList(ENGauge150Filter(FilterObject),0,ColCount);


  LastCount:=High(ENGauge150List.list);

  if LastCount > -1 then
     sgENGauge150.RowCount:=LastCount+2
  else
     sgENGauge150.RowCount:=2;

   with sgENGauge150 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGauge150List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENGauge150List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENGauge150List.list[i].name;
        if ENGauge150List.list[i].dateGauge = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENGauge150List.list[i].dateGauge);
        if ENGauge150List.list[i].tension = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENGauge150List.list[i].tension.DecimalString;
        if ENGauge150List.list[i].current = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENGauge150List.list[i].current.DecimalString;
        if ENGauge150List.list[i].consOwnTrans = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENGauge150List.list[i].consOwnTrans.DecimalString;
        LastRow:=i+1;
        sgENGauge150.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENGauge150.Row:=1;
end;

procedure TfrmENGauge150Show.sgENGauge150TopLeftChanged(Sender: TObject);
var
  TempENGauge150: ENGauge150ControllerSoapPort;
  i,CurrentRow: Integer;
  ENGauge150List: ENGauge150ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENGauge150.TopRow + sgENGauge150.VisibleRowCount) = ColCount
  then
    begin
      TempENGauge150 :=  HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
      CurrentRow:=sgENGauge150.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENGauge150Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGauge150List := TempENGauge150.getScrollableFilteredList(ENGauge150Filter(FilterObject),ColCount-1, 100);



  sgENGauge150.RowCount:=sgENGauge150.RowCount+100;
  LastCount:=High(ENGauge150List.list);
  with sgENGauge150 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGauge150List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENGauge150List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENGauge150List.list[i].name;
        if ENGauge150List.list[i].dateGauge = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENGauge150List.list[i].dateGauge);		  
        if ENGauge150List.list[i].tension = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENGauge150List.list[i].tension.DecimalString;
        if ENGauge150List.list[i].current = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENGauge150List.list[i].current.DecimalString;
        if ENGauge150List.list[i].consOwnTrans = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENGauge150List.list[i].consOwnTrans.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENGauge150.Row:=CurrentRow-5;
   sgENGauge150.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENGauge150Show.sgENGauge150DblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENGauge150,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENGauge150Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENGauge150.RowCount-1 do
   for j:=0 to sgENGauge150.ColCount-1 do
     sgENGauge150.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENGauge150Show.actViewENGauge150Execute(Sender: TObject);
Var TempENGauge150: ENGauge150ControllerSoapPort;
begin
 TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
   try
     ENGauge150Obj := TempENGauge150.getObject(StrToInt(sgENGauge150.Cells[0,sgENGauge150.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENGauge150Edit:=TfrmENGauge150Edit.Create(Application, dsView);
  try
    frmENGauge150Edit.ShowModal;
  finally
    frmENGauge150Edit.Free;
    frmENGauge150Edit := nil;
  end;
end;

procedure TfrmENGauge150Show.actEditENGauge150Execute(Sender: TObject);
Var TempENGauge150: ENGauge150ControllerSoapPort;
begin
 TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
   try
     ENGauge150Obj := TempENGauge150.getObject(StrToInt(sgENGauge150.Cells[0,sgENGauge150.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENGauge150Edit:=TfrmENGauge150Edit.Create(Application, dsEdit);
  try
    if frmENGauge150Edit.ShowModal= mrOk then
      begin
        //TempENGauge150.save(ENGauge150Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENGauge150Edit.Free;
    frmENGauge150Edit:=nil;
  end;
end;

procedure TfrmENGauge150Show.actDeleteENGauge150Execute(Sender: TObject);
Var TempENGauge150: ENGauge150ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENGauge150.Cells[0,sgENGauge150.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Режимные замеры на Трансформаторных Подстанциях 35 - 150 / 6 - 10 - 35 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENGauge150.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENGauge150Show.actInsertENGauge150Execute(Sender: TObject);
// Var TempENGauge150: ENGauge150ControllerSoapPort; 
begin
  // TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENGauge150Obj:=ENGauge150.Create;

   //ENGauge150Obj.dateGauge:= TXSDateTime.Create;
   
   //ENGauge150Obj.tension:= TXSDecimal.Create;
   //ENGauge150Obj.current:= TXSDecimal.Create;
   //ENGauge150Obj.consOwnTrans:= TXSDecimal.Create;

  if ENGauge150Filter(FilterObject).substation150Ref <> nil then
    if ENGauge150Filter(FilterObject).substation150Ref.code <> Low(Integer)
    then
      begin
        //if ENGauge150Obj.substation150Ref = nil then
        ENGauge150Obj.substation150Ref := ENSubstation150Ref.Create;
        ENGauge150Obj.substation150Ref.code :=
          ENGauge150Filter(FilterObject).substation150Ref.code;
      end;

  if ENGauge150Filter(FilterObject).powerTransRef <> nil then
    if ENGauge150Filter(FilterObject).powerTransRef.code <> Low(Integer)
    then
      begin
        //if ENGauge150Obj.substation150Ref = nil then
        ENGauge150Obj.powerTransRef := ENSubst150PowerTransRef.Create;
        ENGauge150Obj.powerTransRef.code :=
          ENGauge150Filter(FilterObject).powerTransRef.code;
      end;

  try
    frmENGauge150Edit:=TfrmENGauge150Edit.Create(Application, dsInsert);
    try
      if frmENGauge150Edit.ShowModal = mrOk then
      begin
        if ENGauge150Obj<>nil then
            //TempENGauge150.add(ENGauge150Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENGauge150Edit.Free;
      frmENGauge150Edit:=nil;
    end;
  finally
    ENGauge150Obj.Free;
  end;
end;

procedure TfrmENGauge150Show.actUpdateENGauge150Execute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENGauge150Show.actFilterENGauge150Execute(Sender: TObject);
begin
{frmENGauge150FilterEdit:=TfrmENGauge150FilterEdit.Create(Application, dsInsert);
  try
    ENGauge150FilterObj := ENGauge150Filter.Create;
    SetNullIntProps(ENGauge150FilterObj);
    SetNullXSProps(ENGauge150FilterObj);

    if frmENGauge150FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENGauge150Filter.Create;
      FilterObject := ENGauge150FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENGauge150FilterEdit.Free;
    frmENGauge150FilterEdit:=nil;
  end;}
end;

procedure TfrmENGauge150Show.actNoFilterENGauge150Execute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.