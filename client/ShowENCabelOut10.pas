
unit ShowENCabelOut10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCabelOut10Controller ;


type
  TfrmENCabelOut10Show = class(TChildForm)  
  HTTPRIOENCabelOut10: THTTPRIO;
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
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENCabelOut10: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENCabelOut10TopLeftChanged(Sender: TObject);
procedure sgENCabelOut10DblClick(Sender: TObject);
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
 // ENCabelOut10Obj: ENCabelOut10;
 // ENCabelOut10FilterObj: ENCabelOut10Filter;
  
  
implementation

uses Main, EditENCabelOut10, EditENCabelOut10Filter;


{$R *.dfm}

var
  //frmENCabelOut10Show : TfrmENCabelOut10Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCabelOut10Headers: array [1..11] of String =
        (  'Код'
          ,'Призначення'
          ,'Марка кабелю'
          ,'Довжина кабелю, м'
          ,'Тип муфти'
          ,'Примітки'
          ,'Код Назначения Кабельной Вставки в ВЛ 6 - 10 кВ'
          ,'Код Материала Кабельной Вставки в ВЛ 6 - 10 кВ'
          ,'Код Типа Муфты Кабельной Вставки в ВЛ 6 - 10 кВ'
          ,'Код ВЛ 6 - 10 кВ, в которой произведена Кабельная Вставка'
          ,'Название ВЛ 6 - 10 кВ, в которой произведена Кабельная Вставка'
        );
   

procedure TfrmENCabelOut10Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCabelOut10Show:=nil;
    inherited;
  end;


procedure TfrmENCabelOut10Show.FormShow(Sender: TObject);
var
  TempENCabelOut10: ENCabelOut10ControllerSoapPort;
  i: Integer;
  ENCabelOut10List: ENCabelOut10ShortList;
  begin
  SetGridHeaders(ENCabelOut10Headers, sgENCabelOut10.ColumnHeaders);
  ColCount:=100;
  TempENCabelOut10 :=  HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelOut10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelOut10List := TempENCabelOut10.getScrollableFilteredList(ENCabelOut10Filter(FilterObject),0,ColCount);


  LastCount:=High(ENCabelOut10List.list);

  if LastCount > -1 then
     sgENCabelOut10.RowCount:=LastCount+2
  else
     sgENCabelOut10.RowCount:=2;

   with sgENCabelOut10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENCabelOut10List.list[i].code <> Low(Integer) then //Код
          Cells[0,i + 1] := IntToStr(ENCabelOut10List.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENCabelOut10List.list[i].typeRefName; //Призначення
        Cells[2, i + 1] := ENCabelOut10List.list[i].materialRefName; //Марка кабелю
        if ENCabelOut10List.list[i].cabelLength <> nil then //Довжина кабелю, м
          Cells[3, i + 1] := ENCabelOut10List.list[i].cabelLength.DecimalString
        else
          Cells[3, i + 1] := '';
        Cells[4, i + 1] := ENCabelOut10List.list[i].muftaRefName; //Тип муфти
        Cells[5, i + 1] := ENCabelOut10List.list[i].name; //Примітки

        Cells[6, i + 1] := IntToStr(ENCabelOut10List.list[i].typeRefCode);      //Код Назначения Кабельной Вставки в ВЛ 6 - 10 кВ
        Cells[7, i + 1] := IntToStr(ENCabelOut10List.list[i].materialRefCode);  //Код Материала Кабельной Вставки в ВЛ 6 - 10 кВ
        Cells[8, i + 1] := IntToStr(ENCabelOut10List.list[i].muftaRefCode);     //Код Типа Муфты Кабельной Вставки в ВЛ 6 - 10 кВ
        Cells[9, i + 1] := IntToStr(ENCabelOut10List.list[i].line10RefCode);    //Код ВЛ 6 - 10 кВ, в которой произведена Кабельная Вставка
        Cells[10, i + 1] := ENCabelOut10List.list[i].line10RefName;             //Название ВЛ 6 - 10 кВ, в которой произведена Кабельная Вставка

        LastRow:=i+1;
        sgENCabelOut10.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCabelOut10.Row:=1;
end;

procedure TfrmENCabelOut10Show.sgENCabelOut10TopLeftChanged(Sender: TObject);
var
  TempENCabelOut10: ENCabelOut10ControllerSoapPort;
  i,CurrentRow: Integer;
  ENCabelOut10List: ENCabelOut10ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCabelOut10.TopRow + sgENCabelOut10.VisibleRowCount) = ColCount
  then
    begin
      TempENCabelOut10 :=  HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
      CurrentRow:=sgENCabelOut10.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelOut10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelOut10List := TempENCabelOut10.getScrollableFilteredList(ENCabelOut10Filter(FilterObject),ColCount-1, 100);



  sgENCabelOut10.RowCount:=sgENCabelOut10.RowCount+100;
  LastCount:=High(ENCabelOut10List.list);
  with sgENCabelOut10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCabelOut10List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCabelOut10List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCabelOut10List.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCabelOut10.Row:=CurrentRow-5;
   sgENCabelOut10.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCabelOut10Show.sgENCabelOut10DblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCabelOut10,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCabelOut10Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCabelOut10.RowCount-1 do
   for j:=0 to sgENCabelOut10.ColCount-1 do
     sgENCabelOut10.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCabelOut10Show.actViewExecute(Sender: TObject);
Var TempENCabelOut10: ENCabelOut10ControllerSoapPort;
begin
 TempENCabelOut10 := HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
   try
     ENCabelOut10Obj := TempENCabelOut10.getObject(StrToInt(sgENCabelOut10.Cells[0,sgENCabelOut10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelOut10Edit:=TfrmENCabelOut10Edit.Create(Application, dsView);
  try
    frmENCabelOut10Edit.ShowModal;
  finally
    frmENCabelOut10Edit.Free;
    frmENCabelOut10Edit:=nil;
  end;
end;

procedure TfrmENCabelOut10Show.actEditExecute(Sender: TObject);
Var TempENCabelOut10: ENCabelOut10ControllerSoapPort;
begin
 TempENCabelOut10 := HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
   try
     ENCabelOut10Obj := TempENCabelOut10.getObject(StrToInt(sgENCabelOut10.Cells[0,sgENCabelOut10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelOut10Edit:=TfrmENCabelOut10Edit.Create(Application, dsEdit);
  try
    if frmENCabelOut10Edit.ShowModal= mrOk then
      begin
        //TempENCabelOut10.save(ENCabelOut10Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCabelOut10Edit.Free;
    frmENCabelOut10Edit:=nil;
  end;
end;

procedure TfrmENCabelOut10Show.actDeleteExecute(Sender: TObject);
Var TempENCabelOut10: ENCabelOut10ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCabelOut10 := HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCabelOut10.Cells[0,sgENCabelOut10.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Кабельні виходи і вставки (лінії 6-10)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCabelOut10.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCabelOut10Show.actInsertExecute(Sender: TObject);
// Var TempENCabelOut10: ENCabelOut10ControllerSoapPort; 
begin
  // TempENCabelOut10 := HTTPRIOENCabelOut10 as ENCabelOut10ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCabelOut10Obj:=ENCabelOut10.Create;

   //ENCabelOut10Obj.cabelLength:= TXSDecimal.Create;


  try
    frmENCabelOut10Edit:=TfrmENCabelOut10Edit.Create(Application, dsInsert);
    try
      if frmENCabelOut10Edit.ShowModal = mrOk then
      begin
        if ENCabelOut10Obj<>nil then
            //TempENCabelOut10.add(ENCabelOut10Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCabelOut10Edit.Free;
      frmENCabelOut10Edit:=nil;
    end;
  finally
    ENCabelOut10Obj.Free;
  end;
end;

procedure TfrmENCabelOut10Show.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCabelOut10Show.actFilterExecute(Sender: TObject);
begin
{frmENCabelOut10FilterEdit:=TfrmENCabelOut10FilterEdit.Create(Application, dsInsert);
  try
    ENCabelOut10FilterObj := ENCabelOut10Filter.Create;
    SetNullIntProps(ENCabelOut10FilterObj);
    SetNullXSProps(ENCabelOut10FilterObj);

    if frmENCabelOut10FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCabelOut10Filter.Create;
      FilterObject := ENCabelOut10FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCabelOut10FilterEdit.Free;
    frmENCabelOut10FilterEdit:=nil;
  end;}
end;

procedure TfrmENCabelOut10Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.