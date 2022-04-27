
unit ShowFINMol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINMolController, AdvObj ;

type
  TfrmFINMolShow = class(TChildForm)
  HTTPRIOFINMol: THTTPRIO;
    ImageList1: TImageList;
    sgFINMol: TAdvStringGrid;
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
procedure sgFINMolTopLeftChanged(Sender: TObject);
procedure sgFINMolDblClick(Sender: TObject);
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
 public
   { Public declarations }

   isFiltered : boolean;
   visiblestate : boolean;

   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList() : FINMolShort; stdcall; static;


 end;

//var
 // FINMolObj: FINMol;
 // FINMolFilterObj: FINMolFilter;
  
  
implementation

uses Main, EditFINMol, EditFINMolFilter;


{$R *.dfm}

var
  //frmFINMolShow : TfrmFINMolShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINMolHeaders: array [1..4] of String =
        ( 'Код'
          ,'ФІО МОЛа'
          ,'Код'
          ,'Статус'
        );
   
class function TfrmFINMolShow.chooseFromList() : FINMolShort;
var
  f1 : FINMolFilter;
  frmFINMolShow : TfrmFINMolShow;
  selectedMol : FINMolShort;
begin
  inherited;
     selectedMol := nil;
     f1 := FINMolFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f1);
       try
          with frmFINMolShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selectedMol := FINMolShort(sgFINMol.Objects[0, sgFINMol.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINMolShow.Free;
       end;
       Result := selectedMol;
end;



procedure TfrmFINMolShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINMolShow:=nil;
    inherited;
  end;


procedure TfrmFINMolShow.FormCreate(Sender: TObject);
begin
  inherited;
    visiblestate:= false;
end;

procedure TfrmFINMolShow.FormShow(Sender: TObject);
var
  TempFINMol: FINMolControllerSoapPort;
  i: Integer;
  FINMolList: FINMolShortList;
  begin
  SetGridHeaders(FINMolHeaders, sgFINMol.ColumnHeaders);
  ColCount:=100;
  TempFINMol :=  HTTPRIOFINMol as FINMolControllerSoapPort;



  if FilterObject = nil then
  begin
     FilterObject := FINMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if not isFiltered then
  begin
     isFiltered := true;
     actFilterExecute(Sender);
     exit;
  end;

  FINMolList := TempFINMol.getScrollableFilteredList(FINMolFilter(FilterObject),0,ColCount);


  LastCount:=High(FINMolList.list);

  if LastCount > -1 then
     sgFINMol.RowCount:=LastCount+2
  else
     sgFINMol.RowCount:=2;

   with sgFINMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        //if FINMolList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := (FINMolList.list[i].id);
        //else
        //Cells[0,i+1] := '';
        Cells[1,i+1] := FINMolList.list[i].text;
        if FINMolList.list[i].obj_id = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(FINMolList.list[i].obj_id);
        if FINMolList.list[i].state = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(FINMolList.list[i].state);

        Objects[0, i+1] := FINMolList.list[i];
        LastRow:=i+1;
        sgFINMol.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINMol.Row:=1;
end;

procedure TfrmFINMolShow.sgFINMolTopLeftChanged(Sender: TObject);
var
  TempFINMol: FINMolControllerSoapPort;
  i,CurrentRow: Integer;
  FINMolList: FINMolShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINMol.TopRow + sgFINMol.VisibleRowCount) = ColCount
  then
    begin
      TempFINMol :=  HTTPRIOFINMol as FINMolControllerSoapPort;
      CurrentRow:=sgFINMol.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMolList := TempFINMol.getScrollableFilteredList(FINMolFilter(FilterObject),ColCount-1, 100);



  sgFINMol.RowCount:=sgFINMol.RowCount+100;
  LastCount:=High(FINMolList.list);
  with sgFINMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        //if FINMolList.list[i].id <> Low(Integer) then
        Cells[0,i+CurrentRow] := (FINMolList.list[i].id);
        //else
        //Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := FINMolList.list[i].text;
        if FINMolList.list[i].obj_id = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(FINMolList.list[i].obj_id);
        if FINMolList.list[i].state = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(FINMolList.list[i].state);

        Objects[0, i+CurrentRow] := FINMolList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINMol.Row:=CurrentRow-5;
   sgFINMol.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINMolShow.sgFINMolDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
//    try
//      temp:=StrToInt(GetReturnValue(sgFINMol,0));
//    except
//      on EConvertError do Exit;
//    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINMolShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINMol.RowCount-1 do
   for j:=0 to sgFINMol.ColCount-1 do
     sgFINMol.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINMolShow.actViewExecute(Sender: TObject);
Var TempFINMol: FINMolControllerSoapPort;
begin
 TempFINMol := HTTPRIOFINMol as FINMolControllerSoapPort;
   try
     FINMolObj := TempFINMol.getObject(StrToInt(sgFINMol.Cells[0,sgFINMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolEdit:=TfrmFINMolEdit.Create(Application, dsView);
  try
    frmFINMolEdit.ShowModal;
  finally
    frmFINMolEdit.Free;
    frmFINMolEdit:=nil;
  end;
end;

procedure TfrmFINMolShow.actEditExecute(Sender: TObject);
Var TempFINMol: FINMolControllerSoapPort;
begin
 TempFINMol := HTTPRIOFINMol as FINMolControllerSoapPort;
   try
     FINMolObj := TempFINMol.getObject(StrToInt(sgFINMol.Cells[0,sgFINMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolEdit:=TfrmFINMolEdit.Create(Application, dsEdit);
  try
    if frmFINMolEdit.ShowModal= mrOk then
      begin
        //TempFINMol.save(FINMolObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINMolEdit.Free;
    frmFINMolEdit:=nil;
  end;
end;

procedure TfrmFINMolShow.actDeleteExecute(Sender: TObject);
Var TempFINMol: FINMolControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINMol := HTTPRIOFINMol as FINMolControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINMol.Cells[0,sgFINMol.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (МОЛи з матеріалів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINMol.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINMolShow.actInsertExecute(Sender: TObject);
Var TempFINMol: FINMolControllerSoapPort;
begin
  TempFINMol := HTTPRIOFINMol as FINMolControllerSoapPort;
  FINMolObj:=FINMol.Create;



  try
    frmFINMolEdit:=TfrmFINMolEdit.Create(Application, dsInsert);
    try
      if frmFINMolEdit.ShowModal = mrOk then
      begin
        if FINMolObj<>nil then
            //TempFINMol.add(FINMolObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINMolEdit.Free;
      frmFINMolEdit:=nil;
    end;
  finally
    FINMolObj.Free;
  end;
end;

procedure TfrmFINMolShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINMolShow.actFilterExecute(Sender: TObject);
begin
frmFINMolFilterEdit:=TfrmFINMolFilterEdit.Create(Application, dsEdit);
  try
    FINMolFilterObj := FINMolFilter.Create;
    SetNullIntProps(FINMolFilterObj);
    SetNullXSProps(FINMolFilterObj);

    if visiblestate = true then
      frmFINMolFilterEdit.CheckBox1.Visible:=True;

    if frmFINMolFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINMolFilter.Create;

      if visiblestate <> true then
      FINMolFilterObj.state := 1; // типа только работающие ...

      FilterObject := FINMolFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINMolFilterEdit.Free;
    frmFINMolFilterEdit:=nil;
  end;
end;

procedure TfrmFINMolShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;

  /// 14.02.11
  FilterObject := FINMolFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);
  ///

  FINMolFilter(FilterObject).state := 1; // типа только работающие ...
  UpdateGrid(Sender);
end;

end.