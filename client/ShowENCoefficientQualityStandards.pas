
unit ShowENCoefficientQualityStandards;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENCoefficientQualityStandardsController, ExtCtrls, TreeList, AdvObj ;


type
    TUpdateMode = (umInsert, umEdit, umDelete);

    TfrmENCoefficientQualityStandardsShow = class(TChildForm)  
    HTTPRIOENCoefficientQualityStandards: THTTPRIO;
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
    Panel1: TPanel;
    Panel2: TPanel;
    sgENCoefficientQualityStandards: TAdvStringGrid;
    Panel3: TPanel;
    tvDep: TTreeList;
    Splitter1: TSplitter;
    HTTPRIOFINExecutor: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENCoefficientQualityStandardsTopLeftChanged(Sender: TObject);
    procedure sgENCoefficientQualityStandardsDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure updatesgENCoefficientQualityStandarts(Sender: TObject);
    procedure tvDepClick(Sender: TObject);
    procedure tvDepDblClick(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject; updateMode: TUpdateMode);
 end;

//var
 // ENCoefficientQualityStandardsObj: ENCoefficientQualityStandards;
 // ENCoefficientQualityStandardsFilterObj: ENCoefficientQualityStandardsFilter;
  
  
implementation

uses Main, EditENCoefficientQualityStandards, EditENCoefficientQualityStandardsFilter,
  FINExecutorController;


{$R *.dfm}

var
  //frmENCoefficientQualityStandardsShow : TfrmENCoefficientQualityStandardsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCoefficientQualityStandardsHeaders: array [1..6] of String =
        ( 'Код'
          ,'Розмір компенсації по якості надання послуг(грн.)(з ПДВ)'
          ,'Коефіцієнт'
          ,'Дата дії коефіцієнту(на перше чісло місяця)'
          ,'айді підрозділу ФК'
          ,'Код подразделения (MS Dynamics AX)'
        );
   

procedure TfrmENCoefficientQualityStandardsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENCoefficientQualityStandardsShow:=nil;
  inherited;
end;


procedure TfrmENCoefficientQualityStandardsShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENCoefficientQualityStandardsShow.FormShow(Sender: TObject);
var
  TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
  i: Integer;
  ENCoefficientQualityStandardsList: ENCoefficientQualityStandardsShortList;

  TempFINExecutor: FINExecutorControllerSoapPort;
  ii: Integer;
  FINExecutorList: FINExecutorShortList;
  finExecFilter : FINExecutorFilter;
begin
  {SetGridHeaders(ENCoefficientQualityStandardsHeaders, sgENCoefficientQualityStandards.ColumnHeaders);
  ColCount:=100;
  TempENCoefficientQualityStandards :=  HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCoefficientQualityStandardsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCoefficientQualityStandardsList := TempENCoefficientQualityStandards.getScrollableFilteredList(ENCoefficientQualityStandardsFilter(FilterObject),0,ColCount);
  LastCount:=High(ENCoefficientQualityStandardsList.list);

  if LastCount > -1 then
     sgENCoefficientQualityStandards.RowCount:=LastCount+2
  else
     sgENCoefficientQualityStandards.RowCount:=2;

   with sgENCoefficientQualityStandards do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCoefficientQualityStandardsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCoefficientQualityStandardsList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENCoefficientQualityStandardsList.list[i].summa = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENCoefficientQualityStandardsList.list[i].summa.DecimalString;
        if ENCoefficientQualityStandardsList.list[i].coefficient = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENCoefficientQualityStandardsList.list[i].coefficient.DecimalString;
        if ENCoefficientQualityStandardsList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENCoefficientQualityStandardsList.list[i].dateGen);
        if ENCoefficientQualityStandardsList.list[i].finPodrCode = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENCoefficientQualityStandardsList.list[i].finPodrCode);
        Cells[5,i+1] := ENCoefficientQualityStandardsList.list[i].axOrgId;
        LastRow:=i+1;
        sgENCoefficientQualityStandards.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENCoefficientQualityStandards.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENCoefficientQualityStandards.RowCount > selectedRow then
      sgENCoefficientQualityStandards.Row := selectedRow
    else
      sgENCoefficientQualityStandards.Row := sgENCoefficientQualityStandards.RowCount - 1;
    end
    else
      sgENCoefficientQualityStandards.Row:=1;    }

      TempFINExecutor :=  HTTPRIOFINExecutor as FINExecutorControllerSoapPort;


  finExecFilter := FINExecutorFilter.Create;
  SetNullIntProps(finExecFilter);
  SetNullXSProps(finExecFilter);
  finExecFilter.finCehCode := StrToInt('1');
  //FINExecutorFilter(FilterObject).conditionSQL := 'p.Main_Podr_Id = 1'; // ХОЕ




  FINExecutorList := TempFINExecutor.getFINExecutorList(finExecFilter,0,-1);

  tvDep.Items.Clear;

   for ii:=0 to High(FINExecutorList.list) do
      begin
        ///////
        tvDep.Items.AddChild(nil, FINExecutorList.list[ii].name + ';;;;;' + FINExecutorList.list[ii].finKindName ).Data := FINExecutorList.list[ii];
      end;


end;


procedure TfrmENCoefficientQualityStandardsShow.sgENCoefficientQualityStandardsTopLeftChanged(Sender: TObject);
var
  TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
  i,CurrentRow: Integer;
  ENCoefficientQualityStandardsList: ENCoefficientQualityStandardsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCoefficientQualityStandards.TopRow + sgENCoefficientQualityStandards.VisibleRowCount) = ColCount
  then
    begin
      TempENCoefficientQualityStandards :=  HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;
      CurrentRow:=sgENCoefficientQualityStandards.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCoefficientQualityStandardsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCoefficientQualityStandardsList := TempENCoefficientQualityStandards.getScrollableFilteredList(ENCoefficientQualityStandardsFilter(FilterObject),ColCount-1, 100);


  sgENCoefficientQualityStandards.RowCount:=sgENCoefficientQualityStandards.RowCount+100;
  LastCount:=High(ENCoefficientQualityStandardsList.list);
  with sgENCoefficientQualityStandards do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCoefficientQualityStandardsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCoefficientQualityStandardsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENCoefficientQualityStandardsList.list[i].summa = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENCoefficientQualityStandardsList.list[i].summa.DecimalString;
        if ENCoefficientQualityStandardsList.list[i].coefficient = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENCoefficientQualityStandardsList.list[i].coefficient.DecimalString;
        if ENCoefficientQualityStandardsList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENCoefficientQualityStandardsList.list[i].dateGen);
        if ENCoefficientQualityStandardsList.list[i].finPodrCode = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENCoefficientQualityStandardsList.list[i].finPodrCode);
        Cells[5,i+CurrentRow] := ENCoefficientQualityStandardsList.list[i].axOrgId;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCoefficientQualityStandards.Row:=CurrentRow-5;
   sgENCoefficientQualityStandards.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCoefficientQualityStandardsShow.tvDepClick(Sender: TObject);
begin
  inherited;
  updatesgENCoefficientQualityStandarts(Sender);
end;

procedure TfrmENCoefficientQualityStandardsShow.tvDepDblClick(Sender: TObject);
var
  c: FINExecutorControllerSoapPort;
  i: Integer;
  FINExecutorList, tempList : FINExecutorShortList;

  f , f1 : FINExecutorFilter;
  tn : TTreeNode;
  kindName: String;
begin
  if tvDep.Selected = nil then Exit;
  if tvDep.Selected.Data = nil then Exit;

   c := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
   f := FINExecutorFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   //f.conditionSQL := ' p.Main_Podr_Id = ' + IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode) ;

   f.finCehCode := FINExecutorShort(tvDep.Selected.Data).finCode;

   // MDAX-441
   f.axParentOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;

   f.orderBySQL := 'p.Nazv';

   tvDep.Selected.DeleteChildren;

  FINExecutorList := c.getFINExecutorList(f,0, -1);

  for i:=0 to High(FINExecutorList.list) do
  begin
          if FINExecutorList.list[i].axOrgId <> '' then
           kindName := FINExecutorList.list[i].axOrgTypeName
         else
           kindName := FINExecutorList.list[i].finKindName;

         //tn := tvDep.Items.AddChild(tvDep.Selected, FINExecutorList.list[i].name + ';;;;;' + FINExecutorList.list[i].finKindName);
         //tn := tvDep.Items.AddChild(tvDep.Selected, AnsiReplaceText(ENDepartmentList.list[i].shortName, ';', '/'));
         tn := tvDep.Items.AddChild(tvDep.Selected, FINExecutorList.list[i].name + ';;;;;' + kindName);

         tn.Data := FINExecutorList.list[i];

         f1 := FINExecutorFilter.Create;
         SetNullIntProps(f1);
         SetNullXSProps(f1);

         //f1.conditionSQL := ' p.Main_Podr_Id = ' + intToStr(FINExecutorList.list[i].finCode) ;

         f1.finCehCode := FINExecutorList.list[i].finCode;

         f1.axParentOrgId := FINExecutorList.list[i].axOrgId;

         tempList := c.getFINExecutorList(f1,0, -1);

         tn.HasChildren := tempList.totalCount > 0;
  end;
  tvDep.Selected.Expand(false);

end;

procedure TfrmENCoefficientQualityStandardsShow.sgENCoefficientQualityStandardsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCoefficientQualityStandards,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENCoefficientQualityStandardsShow.UpdateGrid(Sender: TObject ; updateMode: TUpdateMode );
var 
  i, j: Integer;
begin
{ for i:=1 to sgENCoefficientQualityStandards.RowCount-1 do
   for j:=0 to sgENCoefficientQualityStandards.ColCount-1 do
     sgENCoefficientQualityStandards.Cells[j,i]:='';
   FormShow(Sender); }

   if tvDep.Selected <> nil then
    begin
      if updateMode in [umEdit, umDelete] then
            if tvDep.Selected.Parent <> nil then
            begin
              tvDep.Selected.Parent.DeleteChildren;
            end;

       tvDep.Selected.DeleteChildren;
       tvDepDblClick(Sender );
       tvDep.Selected.Expand(false);
    end;
   updatesgENCoefficientQualityStandarts(Sender);
end;


procedure TfrmENCoefficientQualityStandardsShow.actViewExecute(Sender: TObject);
var 
  TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
begin
  TempENCoefficientQualityStandards := HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;
  try
    ENCoefficientQualityStandardsObj := TempENCoefficientQualityStandards.getObject(StrToInt(sgENCoefficientQualityStandards.Cells[0,sgENCoefficientQualityStandards.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCoefficientQualityStandards.Row;
  frmENCoefficientQualityStandardsEdit:=TfrmENCoefficientQualityStandardsEdit.Create(Application, dsView);
  
  try
    frmENCoefficientQualityStandardsEdit.ShowModal;
  finally
    frmENCoefficientQualityStandardsEdit.Free;
    frmENCoefficientQualityStandardsEdit:=nil;
  end;

  if sgENCoefficientQualityStandards.RowCount > selectedRow then
    sgENCoefficientQualityStandards.Row := selectedRow
  else
    sgENCoefficientQualityStandards.Row := sgENCoefficientQualityStandards.RowCount - 1;
  
end;


procedure TfrmENCoefficientQualityStandardsShow.actEditExecute(Sender: TObject);
var 
  TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
begin
  TempENCoefficientQualityStandards := HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;
  try
    ENCoefficientQualityStandardsObj := TempENCoefficientQualityStandards.getObject(StrToInt(sgENCoefficientQualityStandards.Cells[0,sgENCoefficientQualityStandards.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCoefficientQualityStandards.Row;
  frmENCoefficientQualityStandardsEdit:=TfrmENCoefficientQualityStandardsEdit.Create(Application, dsEdit);
  
  try
    if frmENCoefficientQualityStandardsEdit.ShowModal= mrOk then
      begin
        //TempENCoefficientQualityStandards.save(ENCoefficientQualityStandardsObj);
        UpdateGrid(Sender, umEdit );
      end;
  finally
    frmENCoefficientQualityStandardsEdit.Free;
    frmENCoefficientQualityStandardsEdit:=nil;
  end;

  if sgENCoefficientQualityStandards.RowCount > selectedRow then
    sgENCoefficientQualityStandards.Row := selectedRow
  else
    sgENCoefficientQualityStandards.Row := sgENCoefficientQualityStandards.RowCount - 1;
  
end;


procedure TfrmENCoefficientQualityStandardsShow.actDeleteExecute(Sender: TObject);
Var TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCoefficientQualityStandards := HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCoefficientQualityStandards.Cells[0,sgENCoefficientQualityStandards.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Коефіцієнт дотримання гарантованих стандартів якості надання послуг за підрозділами) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCoefficientQualityStandards.remove(ObjCode);
      UpdateGrid(Sender, umEdit);
  end;
end;

procedure TfrmENCoefficientQualityStandardsShow.actInsertExecute(Sender: TObject);
// Var TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort; 
begin
  // TempENCoefficientQualityStandards := HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCoefficientQualityStandardsObj:=ENCoefficientQualityStandards.Create;
  SetNullIntProps(ENCoefficientQualityStandardsObj);
  SetNullXSProps(ENCoefficientQualityStandardsObj);


   //ENCoefficientExecPlanObj.coefficient:= TXSDecimal.Create;
   //ENCoefficientExecPlanObj.dateGen:= TXSDateTime.Create;


   ENCoefficientQualityStandardsObj.finPodrCode := FINExecutorShort(tvDep.Selected.Data).finCode;
   ENCoefficientQualityStandardsObj.axOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;

  try
    frmENCoefficientQualityStandardsEdit:=TfrmENCoefficientQualityStandardsEdit.Create(Application, dsInsert);
    frmENCoefficientQualityStandardsEdit.edtDateGen.DateTime := Date;

    frmENCoefficientQualityStandardsEdit.lblFinCehName.Caption:= FINExecutorShort(tvDep.Selected.Data).name;
    try
      if frmENCoefficientQualityStandardsEdit.ShowModal = mrOk then
      begin
        if ENCoefficientQualityStandardsObj<>nil then
            //TempENCoefficientQualityStandards.add(ENCoefficientQualityStandardsObj);
            UpdateGrid(Sender, umEdit);
      end;
    finally
      frmENCoefficientQualityStandardsEdit.Free;
      frmENCoefficientQualityStandardsEdit:=nil;
    end;
  finally
    ENCoefficientQualityStandardsObj.Free;
  end;
end;


procedure TfrmENCoefficientQualityStandardsShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender, umEdit);
end;


procedure TfrmENCoefficientQualityStandardsShow.actFilterExecute(Sender: TObject);
begin
{frmENCoefficientQualityStandardsFilterEdit:=TfrmENCoefficientQualityStandardsFilterEdit.Create(Application, dsInsert);
  try
    ENCoefficientQualityStandardsFilterObj := ENCoefficientQualityStandardsFilter.Create;
    SetNullIntProps(ENCoefficientQualityStandardsFilterObj);
    SetNullXSProps(ENCoefficientQualityStandardsFilterObj);

    if frmENCoefficientQualityStandardsFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENCoefficientQualityStandardsFilter.Create;
      FilterObject := ENCoefficientQualityStandardsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCoefficientQualityStandardsFilterEdit.Free;
    frmENCoefficientQualityStandardsFilterEdit:=nil;
  end;}
end;


procedure TfrmENCoefficientQualityStandardsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender,umEdit);
end;

procedure TfrmENCoefficientQualityStandardsShow.updatesgENCoefficientQualityStandarts(Sender: TObject);
var
  TempENCoefficientQualityStandards: ENCoefficientQualityStandardsControllerSoapPort;
  i: Integer;
  ENCoefficientQualityStandardsList: ENCoefficientQualityStandardsShortList;
begin
  sgENCoefficientQualityStandards.Clear;
  SetGridHeaders(ENCoefficientQualityStandardsHeaders, sgENCoefficientQualityStandards.ColumnHeaders);
  ColCount:=2000;
  TempENCoefficientQualityStandards :=  HTTPRIOENCoefficientQualityStandards as ENCoefficientQualityStandardsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCoefficientQualityStandardsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCoefficientQualityStandardsFilter(FilterObject).orderBySQL := ' encoefficintqltstndrds.DATEGEN DESC, encoefficintqltstndrds.CODE DESC ';
  ENCoefficientQualityStandardsFilter(FilterObject).finPodrCode :=  FINExecutorShort(tvDep.Selected.Data).finCode;
  ENCoefficientQualityStandardsFilter(FilterObject).axOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;


  ENCoefficientQualityStandardsList := TempENCoefficientQualityStandards.
                                       getScrollableFilteredList(ENCoefficientQualityStandardsFilter(FilterObject),0,ColCount);

  LastCount:=High(ENCoefficientQualityStandardsList.list);

  if LastCount > -1 then
     sgENCoefficientQualityStandards.RowCount:=LastCount+2
  else
     sgENCoefficientQualityStandards.RowCount:=2;

   with sgENCoefficientQualityStandards do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCoefficientQualityStandardsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCoefficientQualityStandardsList.list[i].code)
        else
        Cells[0,i+1] := '';

        if ENCoefficientQualityStandardsList.list[i].summa = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENCoefficientQualityStandardsList.list[i].summa.DecimalString;

        if ENCoefficientQualityStandardsList.list[i].coefficient = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENCoefficientQualityStandardsList.list[i].coefficient.DecimalString;

        if ENCoefficientQualityStandardsList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithoutTime2String(ENCoefficientQualityStandardsList.list[i].dateGen);


        if ENCoefficientQualityStandardsList.list[i].finPodrCode = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENCoefficientQualityStandardsList.list[i].finPodrCode);

        LastRow:=i+1;
        sgENCoefficientQualityStandards.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCoefficientQualityStandards.Row:=1;
end;

end.